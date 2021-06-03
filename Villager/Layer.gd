extends Node
class_name Layer

var neuronList = []


var output = []

func getContents():
	output.clear()
	for neuron in neuronList:
		output.append(neuron.getBias())
	return output
	
func setContents(inputList):
	for n in neuronList:
		n.setBias(inputList[n])

# Called when the node enters the scene tree for the first time.
func _init(neuronCount):
	for neurons in neuronCount:
		var ne = Neuron.new()
		neuronList.append(ne)
		#print("Made a neuron")
