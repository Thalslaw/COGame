extends Node
class_name Dendrite

var strength = 0.5

func _init():
	#randomise its strength value to be a value between -1 and 1
	strength = (randf()-0.5) * 2
