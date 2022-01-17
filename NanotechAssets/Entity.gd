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
var spriteShown = false #so that we know if things have changed and don't send redundant calls
onready var agSprite = $Ag
onready var arSprite = $Ar
onready var egSprite = $Eg

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
	if !isPlayer:
		if !spriteShown:
			agSprite.visible = true
			arSprite.visible = true
			egSprite.visible = true
			spriteShown = true

func _on_MouseOverBox_mouse_exited():
	if !isPlayer:
		if spriteShown:
			agSprite.visible = false
			arSprite.visible = false
			egSprite.visible = false
			spriteShown = false
