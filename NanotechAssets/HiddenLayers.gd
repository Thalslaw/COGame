extends Node2D

#So it's worth explaining this script as this is where a lot of the personality is contained. 
#The inputs to this are not the raw sensor data, it's the social interactions.
#the purpose of the hidden layers here is to take the inputs and figure out, based on the thing that is done to it, the best drive policy.
#so if you constantly give someone shit, they become grumpy. Love someone and they could turn narcissistic... Here is the operant conditioning chamber

signal output(result)

var result
var layerList = []
var layers = 1 #initialisation value. This changes. Includes layer 0 as input.
var nextNode

var agencySat
var arousalSat
var egoSat

const synapse = preload("res://NanotechAssets/Synapse.gd")
const layer = preload("res://NanotechAssets/Layer.gd")


#these are signals to respond to, and cause 'training' or 'learning' based on everyone else's interactions with this entity.
func ISignal(inputDrive,agency,arousal,ego):
	agencySat = agency
	arousalSat = arousal
	egoSat = ego
	#in layerList[input],if there is a corresponding synapse, trigger it.
	layerList[layerList.count()].Synapse[inputDrive].trigger()

	#for now, just tweak biases
	shallowLearn()
	#if anything but solution
		#shallow learn pass
	#if solution
		#deep learn pass




func deepLearn():
	#these training passes mutate and modify the hidden layer node structure
	pass

func _ready():
	while(layers != -1):
		layerList[layers] = layer.new()
		layers = layers - 1
	layers = layerList.count()
	for l in layerList:
		if (l is layerList[0]): #as layer 0 is the output
			for m in range(0,16):
				nextNode = synapse.new()
			result = layerList[l]
			
		elif(l is layerList.count()):
			#input layer
			for m in range(0,16):
				nextNode = synapse.new()
				
		else:
			#make a node that corresponds to this layer.
			nextNode = synapse.new()#put things to pass to _init in this line's brackets, like connections.

func shallowLearn():
	#these training passes are designed to be short and maybe tweak a few biases a tiny bit
	for l in layerList:
		if (l is layerList[0]):
			#set the outputs to correspond to the outputs that would satisfy the two least satisfied satisfiers
			if((agencySat >> arousalSat) && (agencySat >> egoSat)):
				#agency is most
				#revenge, jealousy, fame, fury, love
				#[explore, fame, fun,fury, jealousy, justice, love, lust, malice, plunder, pride, respect, revenge, solution, status, victory, wealth]
				#[0,1,0,1,1,0,1,0,0,0,0,1,0,0,0,0,0]
				#weight is better viewed as 'threshold'
				l[0].weight = 1.0 
				l[1].weight = 0.0 
				l[2].weight = 1.0 
				l[3].weight = 0.0
				l[4].weight = 0.0
				l[5].weight = 1.0
				l[6].weight = 0.0
				l[7].weight = 1.0
				l[8].weight = 1.0
				l[9].weight = 1.0
				l[10].weight = 1.0
				l[11].weight = 0.0
				l[12].weight = 1.0
				l[13].weight = 1.0
				l[14].weight = 1.0
				l[15].weight = 1.0
				l[16].weight = 1.0
				
			elif ((arousalSat >> agencySat) && (arousalSat >> egoSat)):
				#arousal is most
				#wealth, status, pride, justice, respect, solution
				#[explore, fame, fun,fury, jealousy, justice, love, lust, malice, plunder, pride, respect, revenge, solution, status, victory, wealth]
				#[0,0,0,0,0,1,0,0,0,1,1,0,0,1,1,0,1]
				l[0].weight = 1.0
				l[1].weight = 1.0
				l[2].weight = 1.0
				l[3].weight = 1.0
				l[4].weight = 1.0
				l[5].weight = 0.0
				l[6].weight = 1.0
				l[7].weight = 1.0
				l[8].weight = 1.0
				l[9].weight = 0.0
				l[10].weight = 0.0
				l[11].weight = 1.0
				l[12].weight = 1.0
				l[13].weight = 0.0
				l[14].weight = 0.0
				l[15].weight = 1.0
				l[16].weight = 0.0
				
			elif ((egoSat >> agencySat) && (egoSat >> arousalSat)):
				#ego is most
				#malice, lust, exploration, fun, plunder, victory
				#[explore, fame, fun,fury, jealousy, justice, love, lust, malice, plunder, pride, respect, revenge, solution, status, victory, wealth]
				#[1,0,1,0,0,0,0,1,1,0,0,0,1,0,0,1,0]
				l[0].weight = 0.0
				l[1].weight = 1.0
				l[2].weight = 0.0
				l[3].weight = 1.0
				l[4].weight = 1.0
				l[5].weight = 1.0
				l[6].weight = 1.0
				l[7].weight = 0.0
				l[8].weight = 0.0
				l[9].weight = 1.0
				l[10].weight = 1.0
				l[11].weight = 1.0
				l[12].weight = 0.0
				l[13].weight = 1.0
				l[14].weight = 1.0
				l[15].weight = 0.0
				l[16].weight = 1.0

		else:
			#we need to correct to allow all the weightings to lean into these results
			#layerList[l-1] is output of this set of synapses
			#l is a layerlist element and it needs to tweak towards its output's weights by about 5%
			#for synapse in layer:
			#	for dendrite in synapse:
			#		dendrite.target.weight = ((layer[dendrite.target] - dendrite.target.weight)/20) + dendrite.target.weight
			pass # but basically right now, don't train yet.
