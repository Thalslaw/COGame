extends Node
class_name Layer

var neuronList = []

var i = 0 #this is to address known holes in GDscript

var output = []

func getContents():
	output.clear()
	for neuron in neuronList:
		output.append(neuron)
	return output
	
func setContents(inputList):
	i = 0
	for n in neuronList:
		n.setBias(inputList[i])
		i = i + 1

# Called when the node enters the scene tree for the first time.
func _init(neuronCount):
	for neurons in neuronCount:
		var ne = Neuron.new()
		neuronList.append(ne)
		#print("Made a neuron")
