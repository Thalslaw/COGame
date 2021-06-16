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
onready var huntZone = $HuntZone

#Villagers need brains. This is not optional.
var brain = NeuralNet.new(5)#init args: layercount
var sates = Satisfiers.new()#this is something that signals, because OTHER things might satisfy the villager. Like beer or ambient music.
var urges = []

var nextThingToDo = []

#High level abstract goals that correspond to life fulfilling goals
#A creature existing doing these things is driving narratives. 
#Abstract goals can be impossible to satisfy safely
#Enumerate drives and their corresponding satisfiers lists
enum {null, exploration, fame, fun, fury, jealousy, justice, love, lust, malice, plunder, pride, respect, revenge, solution, status, victory, wealth}
var agencers = [1,3,6,8,9,10,11,12,14,15,16,17]
var arousers = [1,2,3,4,5,7,8,9,10,13,16]
var egoers = [2,4,5,6,7,11,12,13,14,15,17]

var wantList = []
var want

#Mid level intentions analogous to basic instincts that are necessary to survive.
#Creature existing in just this state is stressed and in panic ohshitgunnadie mode
#set of directives they are trying to calculate. Short term needs over abstract goals.


#Low level physical layer actions that the entity is doing or about to do
enum {
	#set of things they are doing directly
	THINK,
	IDLE,
	MOVE,
	ROLL,
	ATTACK
	TALK,
	CHASE
}
var state = IDLE


#get base agentic satisfaction

#get base arousal satisfaction

#get base egoic satisfaction

func _ready():
	pass
	
func think_state(delta):
	#this state should be reached if the entity has finished its list of tasks. 
	urges.clear()

	var agenticness = sates.getAg()
	urges.append(agenticness)
	var arousalness = sates.getAr()
	urges.append(arousalness)
	var egoicness = sates.getEg()
	urges.append(egoicness)
	
	#identify high level goals:
	wantList = brain.think(urges)#input a list of satisfiers, output a list of vague wants.	
	want = 0
	var i = 0
	for wants in wantList:
		i = i + 1
		if (wants.getBias() >= wantList[want].getBias()):
			want = i
	#want now corresponds to the drive the agent wants to do.
	if want == 0:
		#have a hissy fit and die. Just kidding, just throw confused warnings.
		print("An entity had a confusing want. This shouldn't ordinarily happen. Test more quietly.")
	elif want == 1:
		#exploration, 
		#Check when you have explored a previously unknown place, provided you encountered some kind of danger there.
		print("w1: can explore?")
		nextThingToDo.append("explore") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 2:
		#fame, 
		#Check when an NPC who knows your name sees you achieve something noteworthy or remarkable.
		print("w2: can fame?")
		nextThingToDo.append("fame") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 3:
		#fun, 
		#Choose an activity you enjoy.  Check when you disregard your duties and responsibilities to carry out that activity.
		print("w3: can fun?")
		nextThingToDo.append("fun") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 4:
		#fury, 
		#Check when an NPC sees you react to a significant setback or insult with anger and/or unusual violence.  No benefit if they see you fight a monster.
		print("w4: can fury?")
		nextThingToDo.append("fury") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 5:
		#jealousy, 
		#Choose a named person you are jealous of.  Check when they know that you have achieved more than they did. or have done better than them.
		print("w5: can jelly?")
		nextThingToDo.append("jealousy") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 6:
		#justice, 
		#Choose a significant wrong or harm as your cause.  Check when a significant step is taken towards righting it.
		print("w6: can justice?")
		nextThingToDo.append("justice") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 7:
		#love, 
		#Choose an NPC (or with player’s permission, a PC) whom you love.  Check when they receive a benefit which is mainly or solely attributable to you.
		print("w7: can love?")
		nextThingToDo.append("love") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 8:
		#lust, 
		#Check the first time you have sexual intercourse with someone.  No benefit the second and subsequent times.
		print("w8: can lust?")
		nextThingToDo.append("lust") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 9:
		#malice,
		#Check when you watch someone suffer a significant wrong or harm which is mainly or solely attributable to you, provided they did not deserve it.
		print("w9: can malice?")
		nextThingToDo.append("malice") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 10:
		#plunder, 
		#Check when you obtain something of value from someone or something who was unwilling to let you take it.
		print("w10: can plunder?")
		nextThingToDo.append("plunder") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 11:
		#pride, 
		#Check when you publicly condescend to someone of your own social rank or higher.
		print("w11: can pride?")
		nextThingToDo.append("pride") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 12:
		#respect, 
		#Check when someone of your own social rank or higher publicly thanks you or apologises to you for some significant reason.
		print("w12: can respect?")
		nextThingToDo.append("respect") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 13:
		#revenge, 
		#Check when you cause or help to cause a significant harm to someone who has significantly harmed you in the past.
		print("w13: can revenge?")
		nextThingToDo.append("revenge") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 14:
		#solution, 
		#Check when you solve or help to solve a problem or conundrum, or take a significant step towards the same (e.g. find a clue).
		print("w14: can solution?")
		nextThingToDo.append("solution") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 15:
		#status, 
		#Check when you receive a significant promotion, or, when an NPC who was formerly of higher status than you, treats you as an equal or superior.
		print("w15: can status?")
		nextThingToDo.append("status") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 16:
		#victory, 
		#Check when you defeat a significant or powerful foe in battle.
		print("w16: can victory?")
		nextThingToDo.append("victory") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	elif want == 17:
		#wealth
		#Check when you acquire something valuable or desirable, which significantly exceeds in value the rewards earned by your peers.
		print("w17: can wealth?")
		nextThingToDo.append("wealth") #this is here because I haven't decomposed what that necessarily means yet
		state = IDLE
	else:
		#Throw a hissy fit and die
		print("An entity had a confusing want. This shouldn't ordinarily happen. Test more quietly.")

func idle_state(delta):
	#print("entered the idle state")
	if (nextThingToDo.empty()):
		print("has started to think about what to do.")
		state = THINK
	else:
		#print("has stuff to do.")
		
		#OLIVIAAAA. This little section here immediately following is the bit that I want you to fiddle with. <3
		#----
		#BUT nextThingToDo.Clear() IF SUDDENLY/CONVENIENTLY CAN SATISFY:
		#Hungry, thirsty or want treeets?
			#detect if low hp or ego is super low
			#find leef as target
			#chase leef
			#consume leef
		#Horny or depressed?
			#detect if pop count is too low or arousal is super low
			#find person as target
			#chase person
			#consum-... uh, spawn flash and new person.
		#Scared or anxious?
			#detect if threat is near or agency is super low
			#Panik and wiggle
			
		#mission complete if done, mission 'accomplished' if I has a chase template I can trivially boop in (plz <3).
		#----
		pass
		
	#print("finished the idle state")

func move_state(delta):
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
	
	#decriment satisfiers by delta
	sates.depress(delta)
	
	match state:
		THINK:
			think_state(delta)
		IDLE:
			idle_state(delta)
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
		CHASE:
			#var food = Hunting.isTasty
			#if food != null:
			#	var chase = (food.global_position - global_position).normalized()
			#	velocity = velocity.move_toward(chase * MAX_SPEED, ACCELERATION * delta)
			#	bat.flip_h = velocity.x < 0
			#else:
			#	state = IDLE
			pass
	
func move(): #tells physics to work i think?
	velocity = move_and_slide(velocity)
	
#mandatory to reset the character so they can move again.
func roll_animation_finished():
	state = IDLE

func attack_animation_finished():
	state = IDLE
	
func talk_end():
	state = IDLE
	

