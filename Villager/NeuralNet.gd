extends Node
class_name NeuralNet

const EULER = 2.718 #It's irrational, but deal with it.

var output = []
var layerList = []
var learningRate = 0.0
var i #this is to address a known hole in GDscript
var j

func _init(layerCount):
	for n in layerCount:
		if n == 0:
			#reserved for input neurons
			var la = Layer.new(3) #the number of input neurons
			layerList.append(la)
		elif n == layerCount: #else if. Not "file" backwards, brain... you so silly.
			#reserved for output neurons
			var la = Layer.new(17) #the number of output neurons
			layerList.append(la)
		else:
			var la = Layer.new(5) #the number of hidden layer neurons. 
			layerList.append(la)

	
func think(satisfiers):
	##logic catching in case the neural net is garbage goes here
	output.clear()
	i = 0
	j = 0
	#for loop through l layers
	for l in layerList:
		if (l == layerList[0]):
			l.setContents(satisfiers)
			i = i + 1
		else:
			var previousLayer = layerList[j].getContents()
			for neuron in l.getContents():
				for previousNeuron in previousLayer:
					neuron.setBias(1/(1+(pow(EULER, (0.0 - (neuron.getBias() + previousNeuron.getBias()))))))
			i = i + 1
			j = j + 1
	output = layerList[j].getContents()
	return output
