extends Node2D

const LAYER_COUNT = 10

const NEURONBLUEPRINT = preload("res://Neuron.tscn")
const DENDRITEBLUEPRINT = preload("res://Dendrite.tscn")

#needs a list of neurons maybe?

#needs to know how many neurons it has 
export var max_neurons = LAYER_COUNT setget set_max_neurons
var neurons = max_neurons setget set_neurons

signal neurons_modified(value)
signal MAX_neurons_modified(value)

func set_max_neurons(value):
	#max_neurons = value
	#self.max_neurons = min(neurons, max_neurons)
	#emit_signal("MAX_neurons_modified", max_neurons)
	pass

func set_neurons(value):
	#neurons = value
	#emit_signal("neurons_modified", neurons)
	pass



# Called when the node enters the scene tree for the first time.
func _ready():
	var ne = NEURONBLUEPRINT.instance()
	self.add_child(ne)
	#print("Made a neuron")
	var de = DENDRITEBLUEPRINT.instance()
	self.add_child(de)
	
	##spawn that many neurons as this one's children, each differently named?!
	##add_child(neuron)
	pass
