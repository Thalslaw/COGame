extends Node
class_name NeuralNet

#const EULER = 2.718 #It's irrational, but deal with it.

var output = []
var layerList = []
var learningRate = 0.05

func _init(layerCount):
	for n in layerCount:
		var la = []
		if n == 0:
			#reserved for input neurons
			la = Layer.new(3,0) #the number of input neurons
		elif n == layerCount: #else if. Not "file" backwards, brain... you so silly.
			#reserved for output neurons
			la = Layer.new(17, la.count()) #the number of output neurons
		else:
			if (la.size() >= 1):
				la = Layer.new(5, la.count()) #the number of hidden layer neurons. 
			else:
				la = Layer.new(5, 3) #the number of hidden layer neurons. 
		layerList.append(la)

func think(satisfiers):
	output.clear()
	var j = 0
	#for loop through l layers
	for l in layerList:
		if (l == layerList[0]):
			#input layer
			l.setNeurons(satisfiers)
		else:
			#not input layer
			var previousLayer = layerList[j].getNeurons()
			for neuron in l.getNeurons():
				for previousNeuron in previousLayer:
					if (previousNeuron.fired == true):
						neuron.trigger(previousLayer.find(previousNeuron))
			j = j + 1
	output = layerList[j].getNeurons()
	return output

func train(satisfiers, wantedOutput):
	#work backwards from the output and correct for difference from outputs
	var j = 0
	#for loop through l layers
	layerList.invert() ##reverse the list so we can work backwards trivially
	
	for l in layerList:
		if (l == layerList[0]):
			l.setNeurons(wantedOutput)
		else:
			var forwardLayer = layerList[j].getNeurons()
			for neuron in l.getNeurons():
				var k = (layerList.size() - 1)
				for forwardNeuron in forwardLayer:
					while (k >= 0):
						
						#random very small walk of quadratically small amount
						forwardNeuron.dendriteList[k].strength -= (randf()-0.5)*(learningRate * learningRate)
						
						#reinforce good behaviour
						if neuron.fired == true:
							#set strength to adjust in the direction of difference by a factor of learning rate
							forwardNeuron.dendriteList[k].strength += learningRate
						k -= 1
					#opposite of neuron.setBias(1/(1+(pow(EULER, (0.0 - (neuron.getBias() + previousNeuron.getBias()))))))
					#so set threshold to adjust in the direction of difference by a factor of learning rate
					forwardNeuron.setThreshold(forwardNeuron.threshold + ((neuron.threshold - forwardNeuron.threshold) * learningRate))
			j = j + 1
	#something about corresponding to the satisfiers.
	
	layerList.invert() ##now back to the right way round
	
