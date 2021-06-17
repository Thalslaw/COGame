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
	var j = 0
	#for loop through l layers
	for l in layerList:
		if (l == layerList[0]):
			l.setContents(satisfiers)
		else:
			var previousLayer = layerList[j].getContents()
			for neuron in l.getContents():
				for previousNeuron in previousLayer:
					neuron.setBias(1 / ( 1 + (pow(EULER, (0.0 - (neuron.getBias() + previousNeuron.getBias()))))))
			j = j + 1
	output = layerList[j].getContents()
	return output

func train(satisfiers, wantedOutput):
	#work backwards from the output and correct for difference from outputs
	var j = 0
	#for loop through l layers
	layerList.invert() ##reverse the list so we can work backwards trivially
	
	for l in layerList:
		if (l == layerList[0]):
			l.setContents(wantedOutput)
		else:
			var previousLayer = layerList[j].getContents()
			for neuron in l.getContents():
				for previousNeuron in previousLayer:
					#neuron.setBias(1/(1+(pow(EULER, (0.0 - (neuron.getBias() + previousNeuron.getBias()))))))
					
					#set bias to adjust in the direction of difference by a factor of learning rate
					neuron.setBias(neuron.getBias() + ((previousNeuron.getBias() - neuron.getBias()) * learningRate))
					
			j = j + 1
	#something about corresponding to the satisfiers.
	
	layerList.invert() ##now back to the right way round
	
