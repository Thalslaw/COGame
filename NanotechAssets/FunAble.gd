extends Node2D

# Concept: the entity is envisioned as able tosatisfy the fun drive whenever it chooses to abandon leverage held over it in favour of an activity.
# this implies procrastination, but procrastination is envisioned as getting the same leverage multiple times. It is exhausting to deal with procrastinators in the same way.

# the FunAble needs to be able to identify that there is leverage held over the entity to do a task, and any other activity both at the same time.
# the FunAble would require that the 'other' activity is done, and then explicitly removes the leverage held over the entity to do a task.

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var AbleTrue = $True
onready var AbleFalse = $False

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
