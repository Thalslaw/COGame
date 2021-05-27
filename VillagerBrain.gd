extends Node2D

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
	#do some moving, Low level.
	pass
	
func roll_state(delta):
	#do some rolling, Low level.
	pass
	
func attack_state(delta):
	#do some hitty action. Low level
	pass
	
func talk_state(delta):
	#do some talky chattah. Low level.
	pass

func _physics_process(delta):
	
	match state:
		THINK:
			#think_state(delta)
			pass
		IDLE:
			#idle_state(delta)
			pass
		MOVE:
			#move_state(delta)
			pass
		ROLL:
			#roll_state(delta)
			pass
		ATTACK:
			#attack_state(delta)
			pass
		TALK:
			#talk_state(delta)
			pass
	
	
