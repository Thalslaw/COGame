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


# MouseOver variables
onready var mouseSpace = $MouseOverBox
var mousePos


# Satisfier Sprites
var satisfierSpriteShown = false #so that we know if satisfiers have changed and don't send redundant calls
onready var agSprite = $Ag
onready var arSprite = $Ar
onready var egSprite = $Eg


# Drive Sprites
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


func triggerExplore():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerFame():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerFun():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerFury():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerJealousy():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerJustice():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerLove():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerLust():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerMalice():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerPlunder():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerPride():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerRespect():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerRevenge():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerSolution():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerStatus():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerVictory():
	#somebody or something else has triggered this entity's drive.
	pass


func triggerWealth():
	#somebody or something else has triggered this entity's drive.
	pass


func spriteShow(exSp, faSp, fuSp, frSp, jeSp, juSp, loSp, luSp, maSp, plSp, prSp, reSp, rvSp, soSp, stSp, viSp, weSp):
	exploreSprite.visible = exSp
	fameSprite.visible = faSp
	funSprite.visible = fuSp
	furySprite.visible = frSp
	jealousySprite.visible = jeSp
	justiceSprite.visible = juSp
	loveSprite.visible = loSp
	lustSprite.visible = luSp
	maliceSprite.visible = maSp
	plunderSprite.visible = plSp
	prideSprite.visible = prSp
	respectSprite.visible = reSp
	revengeSprite.visible = rvSp
	solutionSprite.visible = soSp
	statusSprite.visible = stSp
	victorySprite.visible = viSp
	wealthSprite.visible = weSp


func _on_MouseOverBox_mouse_entered():
	if (!isPlayer && !satisfierSpriteShown):
		agSprite.visible = true
		arSprite.visible = true
		egSprite.visible = true
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		satisfierSpriteShown = true


func _on_MouseOverBox_mouse_exited():
	if (!isPlayer && satisfierSpriteShown):
		agSprite.visible = false
		arSprite.visible = false
		egSprite.visible = false
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		satisfierSpriteShown = false


func _on_AgencyMouseOverBox_mouse_entered():
	if (agSprite.visible && !isPlayer):
		spriteShow(true, false, true, false, false, true, false, true, true, true, true, true, true, false, true, true, true)


func _on_AgencyMouseOverBox_mouse_exited():
	if (agSprite.visible && !isPlayer):
		spriteShow(true, false, true, false, false, true, false, true, true, true, true, true, false, true, true, true, true)


func _on_ArousalMouseOverBox_mouse_entered():
	if (arSprite.visible && !isPlayer):
		spriteShow(true, true, true, true, true, false, true, true, true, true, false, false, true, false, false, true, false)


func _on_ArousalMouseOverBox_mouse_exited():
	if (arSprite.visible && !isPlayer):
		spriteShow(true, true, true, true, true, false, true, true, true, true, false, false, true, false, false, true, false)


func _on_EgoMouseOverBox_mouse_entered():
	if (egSprite.visible && !isPlayer):
		spriteShow(false, true, false, true, true, true, true, false, false, false, true, true, true, true, true, false, true)


func _on_EgoMouseOverBox_mouse_exited():
	if (egSprite.visible && !isPlayer):
		spriteShow(false, true, false, true, true, true, true, false, false, false, true, true, true, true, true, false, true)


func _on_ExploreMouseOverBox_mouse_entered():
	if (exploreSprite.visible && !isPlayer):
		spriteShow(true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_ExploreMouseOverBox_mouse_exited():
	if (exploreSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_FameMouseOverBox_mouse_entered():
	if (fameSprite.visible && !isPlayer):
		spriteShow(false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_FameMouseOverBox_mouse_exited():
	if (fameSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_FunMouseOverBox_mouse_entered():
	if (funSprite.visible && !isPlayer):
		spriteShow(false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_FunMouseOverBox_mouse_exited():
	if (funSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_FuryMouseOverBox_mouse_entered():
	if (furySprite.visible && !isPlayer):
		spriteShow(false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_FuryMouseOverBox_mouse_exited():
	if (furySprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_JealousyMouseOverBox_mouse_entered():
	if (jealousySprite.visible && !isPlayer):
		spriteShow(false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_JealousyMouseOverBox_mouse_exited():
	if (jealousySprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_JusticeMouseOverBox_mouse_entered():
	if (justiceSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, false)


func _on_JusticeMouseOverBox_mouse_exited():
	if (justiceSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_LoveMouseOverBox_mouse_entered():
	if (loveSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false)


func _on_LoveMouseOverBox_mouse_exited():
	if (loveSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_LustMouseOverBox_mouse_entered():
	if (lustSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false)


func _on_LustMouseOverBox_mouse_exited():
	if (lustSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_MaliceMouseOverBox_mouse_entered():
	if (maliceSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false)


func _on_MaliceMouseOverBox_mouse_exited():
	if (maliceSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_PlunderMouseOverBox_mouse_entered():
	if (plunderSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false)


func _on_PlunderMouseOverBox_mouse_exited():
	if (plunderSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_PrideMouseOverBox_mouse_entered():
	if (prideSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false)


func _on_PrideMouseOverBox_mouse_exited():
	if (prideSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_RespectMouseOverBox_mouse_entered():
	if (respectSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false)


func _on_RespectMouseOverBox_mouse_exited():
	if (respectSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_RevengeMouseOverBox_mouse_entered():
	if (revengeSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false)


func _on_RevengeMouseOverBox_mouse_exited():
	if (revengeSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_SolutionMouseOverBox_mouse_entered():
	if (solutionSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false, false)


func _on_SolutionMouseOverBox_mouse_exited():
	if (solutionSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_StatusMouseOverBox_mouse_entered():
	if (statusSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false, false)


func _on_StatusMouseOverBox_mouse_exited():
	if (statusSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_VictoryMouseOverBox_mouse_entered():
	if (victorySprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, false)


func _on_VictoryMouseOverBox_mouse_exited():
	if (victorySprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_WealthMouseOverBox_mouse_entered():
	if (wealthSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true)


func _on_WealthMouseOverBox_mouse_exited():
	if (wealthSprite.visible && !isPlayer):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)


func _on_ExploreMouseOverBox_input_event(viewport, event, shape_idx):
	if (exploreSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerExplore()


func _on_FameMouseOverBox_input_event(viewport, event, shape_idx):
	if (fameSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerFame()


func _on_FunMouseOverBox_input_event(viewport, event, shape_idx):
	if (funSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerFun()
		

func _on_FuryMouseOverBox_input_event(viewport, event, shape_idx):
	if (furySprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerFury()


func _on_JealousyMouseOverBox_input_event(viewport, event, shape_idx):
	if (jealousySprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerJealousy()


func _on_JusticeMouseOverBox_input_event(viewport, event, shape_idx):
	if (justiceSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerJustice()


func _on_LoveMouseOverBox_input_event(viewport, event, shape_idx):
	if (loveSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerLove()


func _on_LustMouseOverBox_input_event(viewport, event, shape_idx):
	if (lustSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerLust()


func _on_MaliceMouseOverBox_input_event(viewport, event, shape_idx):
	if (maliceSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerMalice()


func _on_PlunderMouseOverBox_input_event(viewport, event, shape_idx):
	if (plunderSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerPlunder()


func _on_PrideMouseOverBox_input_event(viewport, event, shape_idx):
	if (prideSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerPride()


func _on_RespectMouseOverBox_input_event(viewport, event, shape_idx):
	if (respectSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerRespect()


func _on_RevengeMouseOverBox_input_event(viewport, event, shape_idx):
	if (revengeSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerRevenge()


func _on_SolutionMouseOverBox_input_event(viewport, event, shape_idx):
	if (solutionSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerSolution()


func _on_StatusMouseOverBox_input_event(viewport, event, shape_idx):
	if (statusSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerStatus()


func _on_VictoryMouseOverBox_input_event(viewport, event, shape_idx):
	if (victorySprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerVictory()


func _on_WealthMouseOverBox_input_event(viewport, event, shape_idx):
	if (wealthSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerWealth()

