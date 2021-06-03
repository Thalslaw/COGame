extends Node
class_name Neuron

var bias = 0.0

func getBias():
	return bias

func setBias(value):
	bias = value

# Called when the node enters the scene tree for the first time.
func _init():
	#randomise its bias value
	bias = randf()

