extends Node2D

export var max_weight = 1.0 setget set_max_weight
var weight = max_weight setget set_weight

signal weight_modified(value)
signal MAX_weight_modified(value)

func set_max_weight(value):
	#max_weight = value
	#self.max_weight = min(weight, max_weight)
	#emit_signal("MAX_weight_modified",max_weight)
	pass

func set_weight(value):
	#weight = value
	#emit_signal("weight_modified",weight)
	pass

func _ready():
	##randomise the weight
	self.weight = randf()
