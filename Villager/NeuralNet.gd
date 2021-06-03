extends Node
class_name NeuralNet

const EULER = 2.718 #It's irrational, but deal with it.

var output = []
var layerList = []
var learningRate = 0.0

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
	#for loop through l layers
	for l in layerList:
		if (l == 0):
			l.setContents(satisfiers)
		else:
			var previousLayer = layerList[l-1].getContents()
			for neurons in l.getContents():
				for neuron in neurons:
					for previousNeuron in previousLayer:
						neuron.setBias(1/(1+(EULER^(0.0-(neuron.getBias() + previousNeuron.getBias())))))
		output.append(layerList[layerList.count()].getContents())
	return output
