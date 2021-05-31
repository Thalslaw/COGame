extends KinematicBody2D #kinematic body so it can kinetic!

#export vars for movement. allows fine tuning of the character's movement.
export var 	ACCELERATION = 500
export var 	MAX_SPEED = 80
export var 	ROLL_SPEED = 125
export var 	FRICTION = 500

#vector variables for movement.
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN

#gathering objects so that animations can be linked to movement. some may be missing adding those later
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitbox = $Sword/Sword
onready var playerhurt = $Hurtbox
onready var speech = $dotdotdot

#Self
const NNBLUEPRINT = preload("res://NeuralNet.tscn")

#Find Satisfiers.GD and make sure that they exist for this entity.

#The approach is called PPO. Proximal Policy Optimisation
#low level acted first til done,
#if out of low level, find if mid level needs exist
# mid level acted my making low level things.
#if mid level needs do not exist,
#pick a drive to do to make dah drama happan

#Finding its policy is kind'a nested within itself. 


#High level abstract goals that correspond to life fulfilling goals
#A creature existing doing these things is driving narratives. 
#Abstract goals can be impossible to satisfy safely
#Enumerate drives and their corresponding satisfiers lists
enum {null, exploration, fame, fun, fury, jealousy, justice, love, lust, malice, plunder, pride, respect, revenge, solution, status, victory, wealth}
var agencers = [1,3,6,8,9,10,11,12,14,15,16,17]
var arousers = [1,2,3,4,5,7,8,9,10,13,16]
var egoers = [2,4,5,6,7,11,12,13,14,15,17]

#Mid level intentions analogous to basic instincts that are necessary to survive.
#Creature existing in just this state is stressed and in panic ohshitgunnadie mode
enum{
	#set of directives they are trying to calculate. Short term needs over abstract goals.
	haveSex,
	goForAWalk,
	eatSomething,
	doAThing
	
}

#Low level physical layer actions that the entity is doing or about to do
enum {
	#set of things they are doing directly
	THINK,
	IDLE,
	MOVE,
	ROLL,
	ATTACK
	TALK
}
var state = IDLE


#get base agentic satisfaction

#get base arousal satisfaction

#get base egoic satisfaction

func _ready():
	#Make A Neural Net
	var nn = NNBLUEPRINT.instance()
	self.add_child(nn)
	#print("made a neural net")
	
func think_state(delta):
	#this state should be reached if the entity has finished its current low level task
	
	#the plan is to check to see if there is a next low level task and potentially set self up doing it immediately.
	#if it gets too long or returns no list of low level tasks it can immediately do, look to mid level instincts.
	#The mid level also contains improvisations and prompted things it does. A farmer, hungry while working, eats produce.
	#each mid level instinct needs to be defined and described how they do it here by breaking them up into low level tasks,
	#like 'go over there', or 'have sex with this person', or 'hit dat threat'.
	#if no mid level needs exist, then it looks inside its neural net for things it wants to do. 
	#It calls... NeuralNet.Run. 
	
	#procedure: 
	#check environment in small sensor range, its own huntZone
	#iz hungry? nom bat!
	
	pass

func idle_state(delta):
	#this is a catch-all for if things get weird and they dunno what to do. Low level.
	pass	

func move_state(delta):
	#replace inputs with neural net to get movement. 
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		speech.visible = false
		roll_vector = input_vector
		swordHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Move/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Move")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move()
	
	#replace iInput.x to whatever mechanism to trigger the appropiate actions
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		speech.visible = false
		
	if Input.is_action_just_pressed("roll"):
		state = ROLL
		speech.visible = false
		
	if Input.is_action_just_pressed("chat"):
		state = TALK
		speech.visible = false
	
	
func roll_state(delta): #dey be rollin' dey hatin'. no Iframes though
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()
	
func attack_state(delta): #currently non lethal and non-hitty. hitboxes man.
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func talk_state(delta): #my junky talk command thingy...
	velocity = Vector2.ZERO
	speech.visible = true
	talk_end()


func _physics_process(delta):
	
	match state:
		THINK:
			#think_state(delta)
			pass
		IDLE:
			#idle_state(delta)
			pass
		MOVE:
			move_state(delta)
			
		ROLL:
			#roll_state(delta)
			pass
		ATTACK:
			#attack_state(delta)
			pass
		TALK:
			#talk_state(delta)
			pass
	
func move(): #tells physics to work i think?
	velocity = move_and_slide(velocity)
	
#mandatory to reset the character so they can move again.
func roll_animation_finished():
	state = MOVE

func attack_animation_finished():
	state = MOVE
	
func talk_end():
	state = MOVE
