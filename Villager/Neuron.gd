extends Node
class_name Neuron

var dendriteList = [] #these are input dendrites

var bias = 0.0
var threshold = 0.0
var strength = 0.0
var fired = false

func addDendrite():
	var de = Dendrite.new()
	dendriteList.append(de)

func getBias():
	return bias

func setBias(value):
	bias = value

func getThreshold():
	return threshold

func setThreshold(value):
	threshold = value

func trigger(index):
	fired = false
	var inputStrength = dendriteList[index].strength
	strength += (inputStrength * bias)
	if (strength >= threshold):
		strength = 0.0
		fired = true
	else:
		fired = false

func _init():
	#randomise its bias value
	bias = randf()
	threshold = randf()

