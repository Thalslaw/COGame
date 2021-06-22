extends Node
class_name Layer

var neuronList = []
var output = []

func getNeurons():
	output.clear()
	for neuron in neuronList:
		output.append(neuron)
	return output

func setNeurons(inputList):
	var i = 0
	for n in neuronList:
		n.setBias(inputList[i])
		i = i + 1

func _init(neuronCount, prevLa):
	var dendriteToAdd = prevLa
	for neurons in neuronCount:
		var ne = Neuron.new()
		while dendriteToAdd:
			ne.addDendrite()
			dendriteToAdd -= 1 
		neuronList.append(ne)
