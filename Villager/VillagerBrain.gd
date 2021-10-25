extends KinematicBody2D

#vocal is a developer option. It prints a lot of output to the log.
export var vocal = false
var worldData = WorldData

#export vars for movement. allows fine tuning of the character's movement.
export var 	ACCELERATION = 500
export var 	MAX_SPEED = 80
export var 	ROLL_SPEED = 125
export var 	FRICTION = 500
export var STRIDE_LENGTH = 1

#vector variables for movement.
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN

#gathering objects so that animations can be linked to movement. some may be missing adding those later
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitbox = $Sword/Sword
onready var villagerHurt = $Hurtbox
onready var convo = $dotdotdot
onready var speech = $whodat
onready var Hunting = $HuntZone
onready var acting = $ActionZone
onready var stats = $Stats
onready var sprite = $FoxSprite

#variables for the displayed data about the villager if dev mode is on. Also the export vars for tweaking AI
onready var agSpinBox = $AgencyBox
onready var arSpinBox = $ArousalBox
onready var egSpinBox = $EgoBox
export var REWARD_STRENGTH = 0.1

#vars for things spawnable from the villager. The villagers can't self replicate. Don't try that.
const footstep = preload("res://Villager/footprint.tscn")
const deathFlash = preload("res://Action RPG Resources/Effects/Batded.tscn")

#vars for internal logic of the villager.
var leaveFootprint = true
var stride = STRIDE_LENGTH
var knockback = Vector2.ZERO

#Villagers need brains. This is not optional.
var brain = NeuralNet.new(3,3,17)
var sates = Satisfiers.new()
var urges = []

#nextThingToDo is a strategic goal, not a response to current stimuli
var nextThingToDo = []

#list is : {null, exploration, fame, fun, fury, jealousy, justice, love, lust, malice, plunder, pride, respect, revenge, solution, status, victory, wealth}
var agencers = [0,2,5,7,8,9,10,11,13,14,15,16]
var arousers = [0,1,2,3,4,6,7,8,9,12,15]
var egoers = [1,3,4,5,6,10,11,12,13,14,16]

var wantList = []
var want

#Low level physical layer logic that the entity is doing
enum {
	THINK,
	IDLE,
	MOVE,
	ROLL,
	ATTACK
	TALK,
}
var state = IDLE

#Mid level intent layer logic that effects what the entity is about to do
enum {
	FRIENDLY,
	NEUTRAL,
	CAUTIOUS,
	HOSTILE
}
var stance = CAUTIOUS

#on spawning, adding self to the data collection is important for later inferential work
func _ready():
	worldData.addVillager(self)

func _on_Hurtbox_area_entered(area):
	knockback = area.knockback_vector * 120
	stats.health -= area.damage
	villagerHurt.create_flash()

func _on_Stats_no_hp():
	var villagerDie = deathFlash.instance()
	get_parent().add_child(villagerDie)
	villagerDie.global_position = global_position
	queue_free()
	
func reward(doneThis,passFail):
	var rewardStrength = REWARD_STRENGTH
	var rewardTowardsWant = []
	if passFail:
		#true implies we want to encourage this behaviour	
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
		#false implies encourage all but this behaviour
		#make rewardTowardsWant include not the want
		var i = 16
		while i >= 0:
			if (i == doneThis):
				rewardTowardsWant.append(0.0)
			else:
				rewardTowardsWant.append(0.06)
			i -= 1
		brain.train(urges, rewardTowardsWant)
	
	
func think_state(_delta):
	#this state should be reached if the entity has finished its list of tasks and is truly idle and free.
	#delta is not used in this function. It is to remain underscored until it is used.
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
	#want now corresponds to the drive the agent wants to do. The following is to parse the correct data because brain.think() returns a string (for clarity for us)
	if want == 0:
		nextThingToDo.append("explore")
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
			print("Nu! JUST NU!")

func idle_state(delta):
	#this is where we put instinct and unfocussed behaviour.

	#the following section could do with encapsulating in a single status.						----------------------------------
	#this section handles what to do if hurt:
	var panic = false
	#If one is wroth with anger, cease to care about what one stands to gain or lose. 
	#The villager is in battle and that implies acceptance of the chance for death.
	#Otherwise, if experiencing hurt, panic, then one should try to run away.
	if stance != HOSTILE:
		if (stats.health <= (stats.max_health/2)): 
			if Hunting.smell_noms(): ##we need to rename this.
				stance = CAUTIOUS
				state = MOVE
				panic = true
			else:
				panic = false
			#try to find grass to eat
			#scout for noms
			#move to noms
			#eat noms
	#this section handles what to do if experiencing critically high agency.
		#sprite.modulate(Color(0.615686, 0.886275, 0.560784)) green
		#run from people because you are a strong independant villager who don't need no fools.
	#this section handles what to do if experiencing critically low agency.
		#sprite.modulate(Color(0.505882, 0.505882, 0.505882)) grey
		#run for people because you're in desperate need of validation from any fool around.
	#this section handles what to do if experiencing critically high arousal.
		#sprite.modulate(Color(1, 0.609375, 0.609375)) red
		#run from people because otherwise you'll do something precipitous.
	#this section handles what to do if experiencing critically low arousal.
		#sprite.modulate(Color(0.505882, 0.505882, 0.505882)) grey
		#run for people because they're better than being mind-numbingly bored.
	#this section handles what to do if experiencing critically high ego.
		#sprite.modulate(Color(0.654902, 0.388235, 0.92549)) purple
		#run from people because you're clearly better than any of these numpties.
	#this section handles what to do if experiencing critically low ego.
		#sprite.modulate(Color(0.505882, 0.505882, 0.505882)) grey
		#run for people because they can give you a sense of security.
	#the above could do with encapsulating in a single status									-------------------------------------

	#this is where we put longer term drive goals:
	if panic == false:
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
			stance = FRIENDLY
			#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
			#aka, if it is in a village
			#if talkable = hunting.isTalkable?
			friendly_behaviour(delta)
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
		elif (nextThingToDo[0] == "fury"):
			stance = HOSTILE
			#if it assesses it can do the thing:
			#aka, if it is in a village or a dwelling
			unfriendly_behaviour(delta)
		elif (nextThingToDo[0] == "jealousy"):
			stance = FRIENDLY
			#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
			#aka, if it is in a village or a dwelling
			#if talkable = hunting.isTalkable?
			friendly_behaviour(delta)
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
			stance = FRIENDLY
			#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
			#aka, if it is in a village or a dwelling
			#if talkable = hunting.isTalkable?
			friendly_behaviour(delta)
		elif (nextThingToDo[0] == "lust"):
			stance = FRIENDLY
			#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
			#aka, if it is in a dwelling
			#if talkable = hunting.isTalkable?
			friendly_behaviour(delta)
			if acting.seems_Interesting():
				var bebbe = load("res://Action RPG Resources/Player/FoxPerson.tscn").instance()
				get_parent().add_child(bebbe)
		elif (nextThingToDo[0] == "malice"):
			stance = HOSTILE
			#if it assesses it can do the thing:
			#aka, if it is in a valley or a village
			unfriendly_behaviour(delta)
		elif (nextThingToDo[0] == "plunder"):
			stance = HOSTILE
			#if it assesses it can do the thing:
			#aka, if it is in a dungeon or a dwelling
			unfriendly_behaviour(delta)
		elif (nextThingToDo[0] == "pride"):
			stance = FRIENDLY
			#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
			#aka, if it is in a village
			#if talkable = hunting.isTalkable?
			friendly_behaviour(delta)
		elif (nextThingToDo[0] == "respect"):
			stance = FRIENDLY
			#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
			#aka if it is in a village
			#if talkable = hunting.isTalkable?
			friendly_behaviour(delta)
		elif (nextThingToDo[0] == "revenge"):
			stance = HOSTILE
			#if it assesses it can do the thing
			#aka if it is within a dwelling
			unfriendly_behaviour(delta)
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
			stance = FRIENDLY
			#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
			#aka if it is within a dwelling
			friendly_behaviour(delta)
		elif (nextThingToDo[0] == "victory"):
			stance = HOSTILE
			#if it assesses it can do the thing
			#aka if it is within a valley or a dungeon
			unfriendly_behaviour(delta)
		elif (nextThingToDo[0] == "wealth"):
			stance = FRIENDLY
			#if it assesses it can do the thing, and there is a talkable thing in the long range search zone:
			#aka if it is within a dungeon
			#if talkable = hunting.isTalkable?
			friendly_behaviour(delta)
		else:
			print("has stuff to do but wigs the fuck out and has no clue how to do the " + nextThingToDo[0])
			reward(want,false)
			nextThingToDo.pop_front()
		

func unfriendly_behaviour(delta):
	speech.visible = false
	if Hunting.smell_noms():
		#at least long range
		if acting.seems_Interesting():
			# short range
			# give it a reward
			if vocal:
				print("Yay! cookie!")
			reward(want,true)
			state = IDLE
			nextThingToDo.pop_front()
			if vocal:
				print("Cookie nommed.")
			state = ATTACK
		else:
			state = MOVE
	else:
		#if sad,give it a slap
		if (sates.getAg() <= 0.1 || sates.getAr() <= 0.1 || sates.getEg() <= 0.1):
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			state = IDLE
			nextThingToDo.pop_front()
			if vocal:
				print("Am sad.")
		else:
			wanderAbout(delta)
			moveAnimations(velocity)
			self.animationState.travel("Move") #gets travelling to happen via the move state section
			move(delta)

func friendly_behaviour(delta):
	#if you can find someone or not
	if Hunting.smell_noms():
		speech.visible = true
		#at least long range
		if acting.seems_Interesting():
			# short range
			# give it a reward
			if vocal:
				print("Yay! cookie!")
			reward(want,true)
			state = IDLE
			nextThingToDo.pop_front()
			if vocal:
				print("Cookie nommed.")
			state = TALK
		else:
			state = MOVE
	else:
		speech.visible = false
		#if sad,give it a slap
		if (sates.getAg() <= 0.1 || sates.getAr() <= 0.1 || sates.getEg() <= 0.1):
			if vocal:
				print("Nu! *slaps self*")
			reward(want,false)
			state = IDLE
			nextThingToDo.pop_front()
			if vocal:
				print("Am sad.")
		else:
			wanderAbout(delta)
			speech.visible = false
			moveAnimations(velocity)
			self.animationState.travel("Move")
			move(delta)

func hunt_state(delta):
	var target = Hunting.isTasty
	if target != null:
		var chase = global_position
		if stance == FRIENDLY:
			chase = (target.global_position - global_position).normalized()
		elif stance == HOSTILE:
			chase = (target.global_position - global_position).normalized()
		elif stance == CAUTIOUS:
			chase = (target.global_position - global_position).normalized().rotated(PI)
		velocity = velocity.move_toward(chase * MAX_SPEED, ACCELERATION * delta)
		moveAnimations(velocity)
		self.animationState.travel("Move")

	else:
		moveAnimations(velocity)
		self.animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		hungry()
	
	move(delta)
	
	
func roll_state(delta): #dey be rollin' dey hatin'. no Iframes though
	velocity = roll_vector * ROLL_SPEED
	self.animationState.travel("Roll")
	move(delta)
	
func attack_state(_delta):
	#delta is not used in this function. It is to remain underscored until it is used.
	velocity = Vector2.ZERO
	self.animationState.travel("Attack")

func talk_state(_delta):
	#delta is not used in this function. It is to remain underscored until it is used.
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

func wanderAbout(delta):
	#wander somewhere
	velocity = (self.global_position - global_position).normalized().rotated((2*PI*randf()))
	velocity = velocity.move_toward(velocity * MAX_SPEED, ACCELERATION * delta)

func moveAnimations(velocity):
	animationTree.set("parameters/Idle/blend_position", velocity)
	animationTree.set("parameters/Move/blend_position", velocity)
	animationTree.set("parameters/Attack/blend_position", velocity)
	animationTree.set("parameters/Roll/blend_position", velocity)

func move(delta):
	velocity = move_and_slide(velocity)
	#decrement a timer by delta
	stride = stride - delta
	#if timer <= 0,
		#drop a footprint using "var foo = footstep.instance()"
	if(stride <= 0):
		var tracks = footstep.instance()
		tracks.global_position = self.global_position
		get_parent().add_child(tracks)
		stride = STRIDE_LENGTH


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
			roll_state(delta)
		ATTACK:
			attack_state(delta)
		TALK:
			talk_state(delta)

func roll_animation_finished():
	state = IDLE

func attack_animation_finished():
	state = IDLE
	
func talk_end():
	state = IDLE
	


