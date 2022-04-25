extends Node2D

# Declare member variables here. Examples:
var bias = 0.5
onready var showTrue
onready var showFalse
# var b = "text"

func trigger(ag,ar,eg):
	if(ag>=bias||ar>=bias||eg>=bias):
		pass
# Called when the node enters the scene tree for the first time.
func _ready():
	showTrue = get_node("True")
	showFalse = get_node("False")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
