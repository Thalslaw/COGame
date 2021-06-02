extends Node2D

# this is the big boy of the layers, neurons and dendrites.
# expect some wacky shit

const LAYERBLUEPRINT = preload("res://World/Layer.tscn")

##list of layers 

##learning rate as a float

##layer count 

func _ready():
	var la = LAYERBLUEPRINT.instance()
	self.add_child(la)
	#print("Made a Layer")
	
	##take in the learning rate
	##take in the list of layers
	##if the list of layers = 1, just tell it to fuck off
	##else loop through the layer count
		#for each layer, make the layers. 
		#if set up right, they ought to make neurons.
		#if set up right, they ought to make dendrites.
	
	pass
	
func sigmoid(value):
	##yes I know I made a megaline of maths
	##yes I know euler's number is worse than 2.7182818284... etc,. Deal with it.
	return (1/(1+(2.718^(0.0-value))))
	
func run():
	##this is where the magic happens
	##logic catching in case the neural net is garbage goes here
	#for loop through l layers
		#for loop through n neurons
			#if n is 0, is input neuron. equals input n
			#else set neuron value to 0 to reset
			#then... oh boy... 
			#for np; np < this.layers[l-1].neurons.count; np++
				#neuron.value = neuron.value + this.layers[l-1].neurons[np].value * neuron.dendrites[np].weight
			#neuron.value = sigmoid(neuron.value + neuron.bias)	
	pass
