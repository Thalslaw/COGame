extends KinematicBody2D

#variables for fileIO go here
var entityLog = File.new()

#signals for objectIO go here
signal spawn(location)

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

#behaviour and decision variables
export var vulnerable = false

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

onready var selfSprite = $NanobotSprite

# Neural Net (behaviour distributed through calls and signals)
onready var neuralNet = $NeuralNet

# Called when the node enters the scene tree for the first time.
func _ready():
	if (isPlayer):
		neuralNet.visible = true
		neuralNet.decl(isPlayer)

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
		#basic wiggle
		input_vector.x = randf() - randf()
		input_vector.y = randf() - randf()
		input_vector = input_vector.normalized()

	#rotation
	selfSprite.look_at(input_vector)

	#then resolve movement
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)

func logTransaction(drive, isAPlayer):
	#the entityLog already exists for this entity and maybe others.
	entityLog.open("res://entityLog.dat", File.WRITE)
	var content = ("Drive: " + drive + " Player?: " + isAPlayer)
	entityLog.store_string(content)
	entityLog.close()
	
func spawnOffspring():
	#making offspring. Receiver is the one who spawns.
	emit_signal("spawn", global_position)
	
func makeVulnerable(become):
	#this entity becomes socially vulnerable to all in its view
	vulnerable = become
	neuralNet.VulnerableTrue.visible = become
	neuralNet.VulnerableFalse.visible = !become
	
func triggerExplore(sender):
	if(sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Explore", "Player")
		neuralNet.Explore(true)
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Explore", "NotAPlayer")#the notAPlayer is going to be made entity specific later
		neuralNet.Explore(false)

func triggerFame(sender):
	if(sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Fame", "Player")
		neuralNet.Fame(true)
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Fame", "NotAPlayer")
		neuralNet.Fame(false)

func triggerFun(sender):
	if(sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Fun", "Player")
		neuralNet.Fun(true)
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Fun", "NotAPlayer")
		neuralNet.Fun(false)

func triggerFury(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Fury", "Player")
		neuralNet.Fury(true)
		#normally this would make an entity vulnerable
		#die
		queue_free()
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Fury", "NotAPlayer")
		neuralNet.Fury(false)
		#normally this would make an entity vulnerable
		#die
		queue_free()

func triggerJealousy(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		#is vulnerable?
		if(!vulnerable):
			print_debug("Misbehaviour with regards to vulnerability being triggered when it shouldn't.")
		makeVulnerable(false)
		logTransaction("Jealousy", "Player")
		neuralNet.Jealousy(true)
	else:
		#a non player has triggered this entity's drive.
		if(!vulnerable):
			print_debug("Misbehaviour with regards to vulnerability being triggered when it shouldn't.")
		makeVulnerable(false)
		logTransaction("Jealousy", "NotAPlayer")
		neuralNet.Jealousy(false)

func triggerJustice(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Justice", "Player")
		neuralNet.Justice(true)
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Justice", "NotAPlayer")
		neuralNet.Justice(false)

func triggerLove(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Love", "Player")
		neuralNet.Love(true)
		spawnOffspring()
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Love", "NotAPlayer")
		neuralNet.Love(false)
		spawnOffspring()

func triggerLust(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Love", "Player")
		neuralNet.Lust(true)
		spawnOffspring()
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Love", "NotAPlayer")
		neuralNet.Lust(false)
		spawnOffspring()

func triggerMalice(sender):
	if(sender == "Player"):
		#player has triggered this entity's drive.
		#is vulnerable
		if(!vulnerable):
			print_debug("Misbehaviour with regards to vulnerability being triggered when it shouldn't.")
		makeVulnerable(false)
		logTransaction("Malice", "Player")
		neuralNet.Malice(true)
		#normally this would make the entity vulnerable
		#die
		queue_free()
	else:
		#a non player has triggered this entity's drive.
		#is vulnerable
		if(!vulnerable):
			print_debug("Misbehaviour with regards to vulnerability being triggered when it shouldn't.")
		makeVulnerable(false)
		logTransaction("Malice", "NotAPlayer")
		neuralNet.Malice(false)
		#normally this would make the entity vulnerable
		#die
		queue_free()

func triggerPlunder(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Plunder", "Player")
		neuralNet.Plunder(true)
		#make this entity vulnerable
		makeVulnerable(true)
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Plunder", "NotAPlayer")
		neuralNet.Plunder(false)
		#make this entity vulnerable
		makeVulnerable(true)

func triggerPride(sender):
	if(sender == "Player"):
		#player has triggered this entity's drive.
		#is vulnerable
		if(!vulnerable):
			print_debug("Misbehaviour with regards to vulnerability being triggered when it shouldn't.")
		makeVulnerable(false)
		logTransaction("Pride", "Player")
		neuralNet.Pride(true)
	else:
		#a non player has triggered this entity's drive.
		#is vulnerable
		if(!vulnerable):
			print_debug("Misbehaviour with regards to vulnerability being triggered when it shouldn't.")
		makeVulnerable(false)
		logTransaction("Pride", "NotAPlayer")
		neuralNet.Pride(false)

func triggerRespect(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Respect", "Player")
		neuralNet.Respect(true)
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Respect", "NotAPlayer")
		neuralNet.Respect(false)

func triggerRevenge(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		#is vulnerable?
		if(!vulnerable):
			print_debug("Misbehaviour with regards to vulnerability being triggered when it shouldn't.")
		makeVulnerable(false)
		logTransaction("Revenge", "Player")
		neuralNet.Revenge(true)
		#die
		queue_free()
	else:
		#a non player has triggered this entity's drive.
		#is vulnerable?
		if(!vulnerable):
			print_debug("Misbehaviour with regards to vulnerability being triggered when it shouldn't.")
		makeVulnerable(false)
		logTransaction("Revenge", "NotAPlayer")
		neuralNet.Revenge(false)
		#die
		queue_free()

func triggerSolution(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Solution", "Player")
		neuralNet.Solution(true)
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Solution", "NotAPlayer")
		neuralNet.Solution(false)

func triggerStatus(sender):
	if(sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Status", "Player")
		neuralNet.Status(true)
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Status", "NotAPlayer")
		neuralNet.Status(false)

func triggerVictory(sender):
	if(sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Victory", "Player")
		neuralNet.Victory(true)
		#die
		#make this entity vulnerable
		makeVulnerable(true)
		queue_free()
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Victory", "NotAPlayer")
		neuralNet.Victory(false)
		#die
		#make this entity vulnerable
		makeVulnerable(true)
		queue_free()

func triggerWealth(sender):
	if (sender == "Player"):
		#player has triggered this entity's drive.
		logTransaction("Wealth", "Player")
		neuralNet.Wealth(true)
	else:
		#a non player has triggered this entity's drive.
		logTransaction("Wealth", "NotAPlayer")
		neuralNet.Wealth(false)

func spriteShow(exSp, faSp, fuSp, frSp, jeSp, juSp, loSp, luSp, maSp, plSp, prSp, reSp, rvSp, soSp, stSp, viSp, weSp):
	exploreSprite.visible = exSp
	fameSprite.visible = faSp
	funSprite.visible = fuSp
	furySprite.visible = frSp
	if(vulnerable):
		jealousySprite.visible = jeSp
	else:
		jealousySprite.visible = false
	justiceSprite.visible = juSp
	loveSprite.visible = loSp
	lustSprite.visible = luSp
	if(vulnerable):
		maliceSprite.visible = maSp
	else:
		maliceSprite.visible = false
	plunderSprite.visible = plSp
	if(vulnerable):
		prideSprite.visible = prSp
	else:
		prideSprite.visible = false
	respectSprite.visible = reSp
	if(vulnerable):
		revengeSprite.visible = rvSp 
	else:
		revengeSprite.visible = false
	solutionSprite.visible = soSp
	statusSprite.visible = stSp
	if(vulnerable):
		victorySprite.visible = viSp
	else:
		victorySprite.visible = false
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
		triggerExplore("Player")

func _on_FameMouseOverBox_input_event(viewport, event, shape_idx):
	if (fameSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerFame("Player")

func _on_FunMouseOverBox_input_event(viewport, event, shape_idx):
	if (funSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerFun("Player")

func _on_FuryMouseOverBox_input_event(viewport, event, shape_idx):
	if (furySprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerFury("Player")

func _on_JealousyMouseOverBox_input_event(viewport, event, shape_idx):
	if (jealousySprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerJealousy("Player")

func _on_JusticeMouseOverBox_input_event(viewport, event, shape_idx):
	if (justiceSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerJustice("Player")

func _on_LoveMouseOverBox_input_event(viewport, event, shape_idx):
	if (loveSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerLove("Player")

func _on_LustMouseOverBox_input_event(viewport, event, shape_idx):
	if (lustSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerLust("Player")

func _on_MaliceMouseOverBox_input_event(viewport, event, shape_idx):
	if (maliceSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerMalice("Player")

func _on_PlunderMouseOverBox_input_event(viewport, event, shape_idx):
	if (plunderSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerPlunder("Player")

func _on_PrideMouseOverBox_input_event(viewport, event, shape_idx):
	if (prideSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerPride("Player")

func _on_RespectMouseOverBox_input_event(viewport, event, shape_idx):
	if (respectSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerRespect("Player")

func _on_RevengeMouseOverBox_input_event(viewport, event, shape_idx):
	if (revengeSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerRevenge("Player")

func _on_SolutionMouseOverBox_input_event(viewport, event, shape_idx):
	if (solutionSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerSolution("Player")

func _on_StatusMouseOverBox_input_event(viewport, event, shape_idx):
	if (statusSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerStatus("Player")

func _on_VictoryMouseOverBox_input_event(viewport, event, shape_idx):
	if (victorySprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerVictory("Player")

func _on_WealthMouseOverBox_input_event(viewport, event, shape_idx):
	if (wealthSprite.visible && !isPlayer && event is InputEventMouseButton && event.pressed):
		spriteShow(false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false)
		triggerWealth("Player")

func _on_NeuralNet_emotionalState(ag, ar, eg):
	#ag is green, ar is pink, eg is red
	var emoColour = Color(0, eg, (ag+(0.5*ar))/2, (0.5*ar))
	selfSprite.modulate = emoColour
