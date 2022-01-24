extends KinematicBody2D

#variables to control the nanobot go here
#the state of the nanobot determines its hueristic path it follows, if it's an AI
enum{
	IDLE,
	JOINED,
	WANDER,
	CHASE,
	
}
#Is the entity a player, or is the behaviour artificially intelligent?
export var isPlayer = false

#Movement variables
export var 	ACCELERATION = 500
export var 	MAX_SPEED = 80
export var 	ROLL_SPEED = 125
export var 	FRICTION = 500
var input_vector = Vector2.ZERO
var velocity = Vector2.ZERO

#MouseOver variables

onready var mouseSpace = $MouseOverBox
var mousePos

#childSprites
var satisfierSpriteShown = false #so that we know if satisfiers have changed and don't send redundant calls
onready var agSprite = $Ag
onready var arSprite = $Ar
onready var egSprite = $Eg

onready var exploreSprite = $Explore
onready var fameSprite = $Fame
onready var funSprite = $Fun
onready var furySprite = $Fury
onready var jealousySprite = $Jealousy
onready var justiceSprite = $Justice
onready var loveSprite = $Love
onready var lustSprite = $Lust
onready var maliceSprite = $Malice
onready var plunderSprite = $Plunder
onready var prideSprite = $Pride
onready var respectSprite = $Respect
onready var revengeSprite = $Revenge
onready var solutionSprite = $Solution
onready var statusSprite = $Status
onready var victorySprite = $Victory
onready var wealthSprite = $Wealth

#explore
#fame
#fun
#fury
#jealousy
#justice
#love
#lust
#malice
#plunder
#pride
#respect
#revenge
#solution
#status
#victory
#wealth

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#prepare for this frame with a bit of data cleanup
	input_vector = Vector2.ZERO
	
	#is the entity a player, or is the behaviour artificially intelligent?
	if(isPlayer):
		#get inputs
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
		
	else:
		#produce the same data as if the entity were a player.
		
		#also, respond to player interactions.
		
		pass
		

	#then resolve state dependant variables
	
	#then resolve movement
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)


func _on_MouseOverBox_mouse_entered():
	if (!isPlayer && !satisfierSpriteShown):
		agSprite.visible = true
		arSprite.visible = true
		egSprite.visible = true
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false
		satisfierSpriteShown = false


func _on_MouseOverBox_mouse_exited():
	if (!isPlayer && satisfierSpriteShown):
		agSprite.visible = false
		arSprite.visible = false
		egSprite.visible = false
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false
		satisfierSpriteShown = false


func _on_AgencyMouseOverBox_mouse_entered():
	if (agSprite.visible && !isPlayer):
		exploreSprite.visible = true
		fameSprite.Visible = false
		funSprite.visible = true
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = true
		loveSprite.visible = true
		lustSprite.visible = false
		maliceSprite.visible = true
		plunderSprite.visible = true
		prideSprite.visible = true
		respectSprite.visible = true
		revengeSprite.visible = false
		solutionSprite.visible = true
		statusSprite.visible = true
		victorySprite.visible = true
		wealthSprite.visible = true


func _on_AgencyMouseOverBox_mouse_exited():
	if (agSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_ArousalMouseOverBox_mouse_entered():
	if (arSprite.visible && !isPlayer):
		exploreSprite.visible = true
		fameSprite.visible = true
		funSprite.visible = true
		furySprite.visible = true
		jealousySprite.visible = true
		justiceSprite.visible = false
		loveSprite.visible = true
		lustSprite.visible = true
		maliceSprite.visible = true
		plunderSprite.visible = true
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = true
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = true
		wealthSprite.visible = false


func _on_ArousalMouseOverBox_mouse_exited():
	if (arSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_EgoMouseOverBox_mouse_entered():
	if (egSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = true
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = true
		justiceSprite.visible = true
		loveSprite.visible = true
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = true
		respectSprite.visible = true
		revengeSprite.visible = true
		solutionSprite.visible = true
		statusSprite.visible = true
		victorySprite.visible = true
		wealthSprite.visible = true


func _on_EgoMouseOverBox_mouse_exited():
	if (egSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_ExploreMouseOverBox_mouse_entered():
	if (exploreSprite.visible && !isPlayer):
		exploreSprite.visible = true
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_ExploreMouseOverBox_mouse_exited():
	if (exploreSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false 
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_FameMouseOverBox_mouse_entered():
	if (fameSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = true
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_FameMouseOverBox_mouse_exited():
	if (fameSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_FunMouseOverBox_mouse_entered():
	if (funSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = true
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_FunMouseOverBox_mouse_exited():
	if (funSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_FuryMouseOverBox_mouse_entered():
	if (furySprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = true
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_FuryMouseOverBox_mouse_exited():
	if (furySprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_JealousyMouseOverBox_mouse_entered():
	if (jealousySprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = true
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_JealousyMouseOverBox_mouse_exited():
	if (jealousySprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_JusticeMouseOverBox_mouse_entered():
	if (justiceSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = true
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_JusticeMouseOverBox_mouse_exited():
	if (justiceSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_LoveMouseOverBox_mouse_entered():
	if (loveSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = true
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_LoveMouseOverBox_mouse_exited():
	if (loveSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = true
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_LustMouseOverBox_mouse_entered():
	if (lustSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = true
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_LustMouseOverBox_mouse_exited():
	if (lustSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_MaliceMouseOverBox_mouse_entered():
	if (maliceSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = true
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_MaliceMouseOverBox_mouse_exited():
	if (maliceSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_PlunderMouseOverBox_mouse_entered():
	if (plunderSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = true
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_PlunderMouseOverBox_mouse_exited():
	if (plunderSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_PrideMouseOverBox_mouse_entered():
	if (prideSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = true
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_PrideMouseOverBox_mouse_exited():
	if (prideSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_RespectMouseOverBox_mouse_entered():
	if (respectSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = true
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_RespectMouseOverBox_mouse_exited():
	if (respectSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_RevengeMouseOverBox_mouse_entered():
	if (revengeSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = true
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_RevengeMouseOverBox_mouse_exited():
	if (revengeSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_SolutionMouseOverBox_mouse_entered():
	if (solutionSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = true
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_SolutionMouseOverBox_mouse_exited():
	if (solutionSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_StatusMouseOverBox_mouse_entered():
	if (statusSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = true
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_StatusMouseOverBox_mouse_exited():
	if (statusSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = true
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_VictoryMouseOverBox_mouse_entered():
	if (victorySprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = true
		wealthSprite.visible = false


func _on_VictoryMouseOverBox_mouse_exited():
	if (victorySprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_WealthMouseOverBox_mouse_entered():
	if (wealthSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = true


func _on_WealthMouseOverBox_mouse_exited():
	if (wealthSprite.visible && !isPlayer):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_ExploreMouseOverBox_input_event(viewport, event, shape_idx):
	if (exploreSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_FameMouseOverBox_input_event(viewport, event, shape_idx):
	if (fameSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_FunMouseOverBox_input_event(viewport, event, shape_idx):
	if (funSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_FuryMouseOverBox_input_event(viewport, event, shape_idx):
	if (furySprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_JealousyMouseOverBox_input_event(viewport, event, shape_idx):
	if (jealousySprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_JusticeMouseOverBox_input_event(viewport, event, shape_idx):
	if (justiceSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_LoveMouseOverBox_input_event(viewport, event, shape_idx):
	if (loveSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_LustMouseOverBox_input_event(viewport, event, shape_idx):
	if (lustSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_MaliceMouseOverBox_input_event(viewport, event, shape_idx):
	if (maliceSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_PlunderMouseOverBox_input_event(viewport, event, shape_idx):
	if (plunderSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_PrideMouseOverBox_input_event(viewport, event, shape_idx):
	if (prideSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_RespectMouseOverBox_input_event(viewport, event, shape_idx):
	if (respectSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_RevengeMouseOverBox_input_event(viewport, event, shape_idx):
	if (revengeSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_SolutionMouseOverBox_input_event(viewport, event, shape_idx):
	if (solutionSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_StatusMouseOverBox_input_event(viewport, event, shape_idx):
	if (statusSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_VictoryMouseOverBox_input_event(viewport, event, shape_idx):
	if (victorySprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false


func _on_WealthMouseOverBox_input_event(viewport, event, shape_idx):
	if (wealthSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		exploreSprite.visible = false
		fameSprite.visible = false
		funSprite.visible = false
		furySprite.visible = false
		jealousySprite.visible = false
		justiceSprite.visible = false
		loveSprite.visible = false
		lustSprite.visible = false
		maliceSprite.visible = false
		plunderSprite.visible = false
		prideSprite.visible = false
		respectSprite.visible = false
		revengeSprite.visible = false
		solutionSprite.visible = false
		statusSprite.visible = false
		victorySprite.visible = false
		wealthSprite.visible = false
