extends Node
class_name Instincts

#feed in its sense data.
var Ins = []
var Outs = []

var layerList = []
var layerCount = 2 #starting layercount. Mutates.
var outputList = []
var output

func breedData():
	#pass them the hidden layer information.
	return layerList

func _init(inputs, outputs):
	Ins.append(inputs)
	Outs.append(outputs)
	for n in layerCount:
		var la = layerCount
		if n == 0:
			#reserved for input neurons
			la = Layer.new(Ins.count(),0) #the number of input neurons
		elif n == layerCount: #else if. Not "file" backwards, brain... you so silly.
			#reserved for output neurons
			la = Layer.new(Outs.count(), la.count()) #the number of output neurons
		else:
			if (la.size() >= 1):
				la = Layer.new(5, la.count()) #the number of hidden layer neurons. 
			else:
				la = Layer.new(5, 3) #the number of hidden layer neurons. 
		layerList.append(la)

func InstinctiveChoice(inputs):
	output.clear()
	var j = 0
	#for loop through l layers
	for l in layerList:
		if (l == layerList[0]):
			#input layer
			l.setNeurons(inputs)
		else:
			#not input layer
			var previousLayer = layerList[j].getNeurons()
			for neuron in l.getNeurons():
				for previousNeuron in previousLayer:
					if (previousNeuron.fired == true):
						neuron.trigger(previousLayer.find(previousNeuron))
			j = j + 1
	outputList = layerList[j].getNeurons()
	output = outputList.find(outputList.max())
	return output #this returns 'which', not 'how much'.

func _ready():
	pass
	
#func _process(delta):
#	pass
