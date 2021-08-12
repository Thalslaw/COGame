extends KinematicBody2D #kinematic body so it can kinetic!

#export vars for seeing if we care about listening to this one:
export var vocal = false

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
onready var convo = $dotdotdot
onready var speech = $whodat
onready var Hunting = $HuntZone
onready var acting = $ActionZone
onready var foottime = $footTimer

onready var agSpinBox = $AgencyBox
onready var arSpinBox = $ArousalBox
onready var egSpinBox = $EgoBox

const footstep = preload("res://Villager/footprint.tscn")

#Villagers need brains. This is not optional.
var brain = NeuralNet.new(3)#init args: layercount
var sates = Satisfiers.new()#this is something that signals, because OTHER things might satisfy the villager. Like beer or ambient music.
var urges = []

var nextThingToDo = []

#High level abstract goals that correspond to life fulfilling goals
#A creature existing doing these things is driving narratives. 
#Abstract goals can be impossible to satisfy safely
#Enumerate drives and their corresponding satisfiers lists
#enum {null, exploration, fame, fun, fury, jealousy, justice, love, lust, malice, plunder, pride, respect, revenge, solution, status, victory, wealth}
var agencers = [0,2,5,7,8,9,10,11,13,14,15,16]
var arousers = [0,1,2,3,4,6,7,8,9,12,15]
var egoers = [1,3,4,5,6,10,11,12,13,14,16]

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

enum {
	#set of stances. If they are intending to be friendly or unfriendly
	FRIENDLY,
	CAUTIOUS,
	HOSTILE
}
var stance = CAUTIOUS

#get base agentic satisfaction

#get base arousal satisfaction

#get base egoic satisfaction

func _ready():
	pass
	
func reward(doneThis,passFail):
	#configure reward strength to include gland fatigue
	var rewardStrength = 0.1
	
	var rewardTowardsWant = []
	if passFail:
		#train with yes		
		#make rewardTowardsWant include just the want
		var i = 16
		while i >= 0:
			if (i == doneThis):
				rewardTowardsWant.append(1.0)
			else:
				rewardTowardsWant.append(0.0)
			i -= 1
		brain.train(urges, rewardTowardsWant)
		
		#reward with satisfaction
		sates.set_agentic_satisfaction(sates.getAg() + rewardStrength)
		sates.set_arousal_satisfaction(sates.getAr() + rewardStrength)
		sates.set_egoic_satisfaction(sates.getEg() + rewardStrength)
	else:
		#train with no
		#make wanted output include a random seizure set
		var i = 16
		while i >= 0:
			if (i == doneThis):
				rewardTowardsWant.append(0.0)
			else:
				rewardTowardsWant.append(0.06)
			i -= 1
		brain.train(urges, rewardTowardsWant)
	
	
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
		if (wants.strength >= wantList[i].strength):
			want = i
		i += 1
	#want now corresponds to the drive the agent wants to do.
	if want == 0:
		nextThingToDo.append("explore") #this is here because long term strategic goals can be interrupted and such. Same with the rest.
		state = IDLE
	elif want == 1:
		nextThingToDo.append("fame") 
		state = IDLE
	elif want == 2:
		nextThingToDo.append("fun") 
		state = IDLE
	elif want == 3:
		nextThingToDo.append("fury") 
		state = IDLE
	elif want == 4:
		nextThingToDo.append("jealousy")
		state = IDLE
	elif want == 5:
		nextThingToDo.append("justice") 
		state = IDLE
	elif want == 6:
		nextThingToDo.append("love")
		state = IDLE
	elif want == 7:
		nextThingToDo.append("lust")
		state = IDLE
	elif want == 8:
		nextThingToDo.append("malice") 
		state = IDLE
	elif want == 9:
		nextThingToDo.append("plunder")
		state = IDLE
	elif want == 10:
		nextThingToDo.append("pride") 
		state = IDLE
	elif want == 11:
		nextThingToDo.append("respect") 
		state = IDLE
	elif want == 12:
		nextThingToDo.append("revenge")
		state = IDLE
	elif want == 13:
		nextThingToDo.append("solution") 
		state = IDLE
	elif want == 14:
		nextThingToDo.append("status")
		state = IDLE
	elif want == 15:
		nextThingToDo.append("victory")
		state = IDLE
	elif want == 16:
		nextThingToDo.append("wealth")
		state = IDLE
	else:
		#Throw a hissy fit and die
		print("An entity had a confusing want. This shouldn't ordinarily happen. Test more quietly.")
		if vocal:
			print("Nu! *slaps self*")
		reward(want,false)
		if vocal:
			print("Am sad.")

func idle_state(delta):
	
	#this is where we put overriding reactions to things! stances and whims and stuff!
	#if hungry:
		#nextthingtodo == feeeeed meeeeee
	#if horny: 
		#nextthingtodo == lust?
	#if threatened:
		#if not doing a fighty drive
			#flee!
	
	
	#this is where we put longer term drive goals:
	if (nextThingToDo.empty()):
		if vocal:
			print("has started to think about what to do.")
		state = THINK
	#elif (nextThingToDo[0] == "exploration"):
		#if it assesses it can do the thing:
		#aka, if it's in a valley or a dungeon:
			#if (too far to interact):
				#set target as suitable interactables	
				#state = chase
			#else
				#interact with the thing
				#then give it a cookie
		#else
			#nextThingToDo.append("GoTo_ValleyOrDungeon")
		#nextThingToDo.pop_front()
	elif (nextThingToDo[0] == "fame"):
		#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
		#aka, if it is in a village
		#if talkable = hunting.isTalkable?
		if Hunting.smell_noms():
			#at least long range
			if acting.seems_Interesting():
				# short range
				#reward
				if vocal:
					print("Yay! cookie!")
				reward(want,true)
				if vocal:
					print("Cookie nommed.")
				state = TALK
			else:
				state = MOVE
		else:
			#give it a slap
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			if vocal:
				print("Am sad.")
	#elif (nextThingToDo[0] == "fun"):
		#if it assesses it can do the thing:
		#aka, if it is in a village
			#if (too far to interact):
				#set target as suitable interactables
				#state = chase
			#else
				#interact with the thing
				#then give it a cookie
		#else
			#give it a slap
		#nextThingToDo.pop_front()
	#elif (nextThingToDo[0] == "fury"):
		#if it assesses it can do the thing:
		#aka, if it is in a village or a dwelling
			#if (too far to attack):
				#set target as villagers or player
				#state = chase
			#else:
				#state = attack
				#then give it a cookie
		#else
			#give it a slap
		#nextThingToDo.pop_front()
	elif (nextThingToDo[0] == "jealousy"):
		#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
		#aka, if it is in a village or a dwelling
		#if talkable = hunting.isTalkable?
		if Hunting.smell_noms():
			#at least long range
			if acting.seems_Interesting():
				# short range
				#reward
				if vocal:
					print("Yay! cookie!")
				reward(want,true)
				if vocal:
					print("Cookie nommed.")
				state = TALK
			else:
				state = MOVE
		else:
			#give it a slap
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			if vocal:
				print("Am sad.")
		nextThingToDo.pop_front()
	#elif (nextThingToDo[0] == "justice"):
		#if it assesses it can do the thing:
		#aka, if it is in a dwelling
			#if (too far to interact):
				#set target as suitable interactables
				#state = chase
			#else
				#interact with the thing
				#give it a cookie
		#else
			#give it a slap
		#nextThingToDo.pop_front()
	elif (nextThingToDo[0] == "love"):
		#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
		#aka, if it is in a village or a dwelling
		#if talkable = hunting.isTalkable?
		if Hunting.smell_noms():
			#at least long range
			if acting.seems_Interesting():
				# short range
				#reward
				if vocal:
					print("Yay! cookie!")
				reward(want,true)
				if vocal:
					print("Cookie nommed.")
				state = TALK
			else:
				state = MOVE
		else:
			#give it a slap
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			if vocal:
				print("Am sad.")
	elif (nextThingToDo[0] == "lust"):
		#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
		#aka, if it is in a dwelling
		#if talkable = hunting.isTalkable?
		if Hunting.smell_noms():
			#at least long range
			if acting.seems_Interesting():
				# short range
				#reward
				if vocal:
					print("Yay! cookie!")
				reward(want,true)
				if vocal:
					print("Cookie nommed.")
				state = TALK
			else:
				state = MOVE
		else:
			#give it a slap
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			if vocal:
				print("Am sad.")
	#elif (nextThingToDo[0] == "malice"):
		#if it assesses it can do the thing:
		#aka, if it is in a valley or a village
			#if (too far to attack):
				#set target as villagers or player
				#state = chase
			#else:
				#state = attack
				#give it a cookie
		#else
			#give it a slap
		#nextThingToDo.pop_front()
	#elif (nextThingToDo[0] == "plunder"):
		#if it assesses it can do the thing:
		#aka, if it is in a dungeon or a dwelling
			#if (too far to attack):
				#set target as villagers or player
				#state = chase
			#else:
				#state = attack
				#give it a cookie
		#else
			#give it a slap
		#nextThingToDo.pop_front()
	elif (nextThingToDo[0] == "pride"):
		#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
		#aka, if it is in a village
		#if talkable = hunting.isTalkable?
		if Hunting.smell_noms():
			#at least long range
			if acting.seems_Interesting():
				# short range
				#reward
				if vocal:
					print("Yay! cookie!")
				reward(want,true)
				if vocal:
					print("Cookie nommed.")
				state = TALK
			else:
				state = MOVE
		else:
			#give it a slap
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			if vocal:
				print("Am sad.")
	elif (nextThingToDo[0] == "respect"):
		#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
		#aka if it is in a village
		#if talkable = hunting.isTalkable?
		if Hunting.smell_noms():
			#at least long range
			if acting.seems_Interesting():
				# short range
				#reward
				if vocal:
					print("Yay! cookie!")
				reward(want,true)
				if vocal:
					print("Cookie nommed.")
				state = TALK
			else:
				state = MOVE
		else:
			#give it a slap
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			if vocal:
				print("Am sad.")
	#elif (nextThingToDo[0] == "revenge"):
		#if it assesses it can do the thing
		#aka if it is within a dwelling
			#if (too far to attack):
				#set target as villagers or player
				#state = chase
			#else:
				#state = attack
				#give it a cookie
		#else:
			#Give it a slap
		#nextThingToDo.pop_front()
	#elif (nextThingToDo[0] == "solution"):
		#if it assesses it can do the thing:
		#aka if it is within a dwelling or a dungeon
			#if (too far to interact):
				#set target as suitable interactables
				#state = chase
			#else
				#interact with the thing
				#give it a cookie
		#else:
			#give it a slap
		#nextThingToDo.pop_front()
	elif (nextThingToDo[0] == "status"):
		#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
		#aka if it is within a dwelling
		#if talkable = hunting.isTalkable?
		if Hunting.smell_noms():
			#at least long range
			if acting.seems_Interesting():
				# short range
				#reward
				if vocal:
					print("Yay! cookie!")
				reward(want,true)
				if vocal:
					print("Cookie nommed.")
				state = TALK
			else:
				state = MOVE
		else:
			#give it a slap
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			if vocal:
				print("Am sad.")
	#elif (nextThingToDo[0] == "victory"):
		#if it assesses it can do the thing
		#aka if it is within a valley or a dungeon
			#if (too far to attack):
				#set target as enemies
				#state = chase
			#else:
				#state = attack
				#give it a cookie
		#else
			#give it a slap
		#nextThingToDo.pop_front()
	elif (nextThingToDo[0] == "wealth"):
		#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
		#aka if it is within a dungeon
		#if talkable = hunting.isTalkable?
		if Hunting.smell_noms():
			#at least long range
			if acting.seems_Interesting():
				# short range
				#reward
				if vocal:
					print("Yay! cookie!")
				reward(want,true)
				if vocal:
					print("Cookie nommed.")
				state = TALK
			else:
				state = MOVE
		else:
			#give it a slap
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			if vocal:
				print("Am sad.")
	else:
		print("has stuff to do but wigs the fuck out and has no clue how to do the " + nextThingToDo[0])
		reward(want,false)
		nextThingToDo.pop_front()
		
	#print("finished the idle state")

func hunt_state(delta):
	var velocity = Vector2.ZERO
	var food = Hunting.isTasty
	if food != null:
		var chase = (food.global_position - global_position).normalized()
		velocity = velocity.move_toward(chase * MAX_SPEED, ACCELERATION * delta)
		speech.visible = false
		roll_vector = velocity
		#swordHitbox.knockback_vector =
		animationTree.set("parameters/Idle/blend_position", velocity)
		animationTree.set("parameters/Move/blend_position", velocity)
		animationTree.set("parameters/Attack/blend_position", velocity)
		animationTree.set("parameters/Roll/blend_position", velocity)
		animationState.travel("Move")
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		hungry()
	
	velocity = move_and_slide(velocity)
	
	move(delta)
	
	#take in the movement distance and drop a footprint using "var foo = footstep.instance()"
	
	#replace iInput.x to whatever mechanism to trigger the appropiate actions
	#if Input.is_action_just_pressed("attack"):
	#	state = ATTACK
	#	speech.visible = false
	#	
	#if Input.is_action_just_pressed("roll"):
	#	state = ROLL
	#	speech.visible = false
	#	
	#if Input.is_action_just_pressed("chat"):
	#	state = TALK
	#	speech.visible = false
	
	
func roll_state(delta): #dey be rollin' dey hatin'. no Iframes though
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move(delta)
	
func attack_state(delta): #currently non lethal and non-hitty. hitboxes man.
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func talk_state(delta): #my junky talk command thingy...
	velocity = Vector2.ZERO
	speech.visible = true
	talk_end()

func hungry():
	if Hunting.smell_noms():
		state = MOVE

func check_arrived():
	#simple implementation right now. doesn't behave as wanted.
	if acting.seems_Interesting():
		return true

func _physics_process(delta):

	#decriment satisfiers by delta
	sates.depress(delta)
	
	#if vocal, display information
	if vocal:
		agSpinBox.set_value(sates.getAg()*100)
		agSpinBox.apply()
		arSpinBox.set_value(sates.getAr()*100)
		arSpinBox.apply()
		egSpinBox.set_value(sates.getEg()*100)
		egSpinBox.apply()

	match state:
		THINK:
			think_state(delta)
		IDLE:
			idle_state(delta)
		MOVE:
			#check if they're arrived
			if check_arrived():
				state = IDLE
			else:
				hunt_state(delta)
		ROLL:
			#roll_state(delta)
			pass
		ATTACK:
			#attack_state(delta)
			pass
		TALK:
			talk_state(delta)
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
	
func move(delta):
	velocity = move_and_slide(velocity)
	#decrement a timer by delta
	#if timer <= 0,
		#drop a footprint using "var foo = footstep.instance()"


func roll_animation_finished():
	state = IDLE

func attack_animation_finished():
	state = IDLE
	
func talk_end():
	state = IDLE
	


