extends Node2D

#So it's worth explaining this script as this is where a lot of the personality is contained. 
#The inputs to this are not the raw sensor data, it's the social interactions.
#the purpose of the hidden layers here is to take the inputs and figure out, based on the thing that is done to it, the best drive policy.
#so if you constantly give someone shit, they become grumpy. Love someone and they could turn narcissistic... Here is the operant conditioning chamber

signal output(result)

var result
var genes = []
var nodes = []
var layerList = []
var layers = 1 #initialisation value. This changes. Includes layer 0 as input.
var nextNode #axon
var biasNode

const synapse = preload("res://NanotechAssets/Synapse.gd")
const layer = preload("res://NanotechAssets/Layer.gd")


#these are signals to respond to, and cause 'training' or 'learning' based on everyone else's interactions with this entity.
func ISignal(inputDrive,agency,arousal,ego):
	#in layerList[input],if there is a corresponding synapse, trigger it.
	layerList[layerList.count()].neuron[inputDrive].trigger()
	#if anything but solution
		#shallow learn pass
	#if solution
		#deep learn pass
	pass

func shallowLearn():
	#these training passes are designed to be short and maybe tweak a few biases a tiny bit
	
	pass

func deepLearn():
	#these training passes mutate and modify the hidden layer node structure
	pass

func _ready():
	while(layers != -1):
		layerList[layers] = layer.new()
		layers = layers - 1
	layers = layerList.count()
	for l in layerList:
		if (l != 0): #as layer 0 is the output
			#ignore but initialise instead
			nextNode = result
		elif(l == layerList.count()):
			#input layer
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
			synapse.new()
		else:
			#make a node that corresponds to this layer.
			nextNode = synapse.new()#put things to pass to _init in this line's brackets, like connections.


#func train(_satisfiers, wantedOutput):
#	#work backwards from the output and correct for difference from outputs
#	var j = 0
#	#for loop through l layers
#	layerList.invert() ##reverse the list so we can work backwards trivially
#	
#	for l in layerList:
#		if (l == layerList[0]):
#			l.setNeurons(wantedOutput)
#		else:
#			var forwardLayer = layerList[j].getNeurons()
#			for neuron in l.getNeurons():
#				var k = (layerList.size() - 1)
#				for forwardNeuron in forwardLayer:
#					while (k >= 0):
#						
#						#random very small walk of quadratically small amount
#						forwardNeuron.dendriteList[k].strength -= (randf()-0.5)*(learningRate * learningRate)
#						
#						#reinforce good behaviour
#						if neuron.fired == true:
#							#set strength to adjust in the direction of difference by a factor of learning rate
#							forwardNeuron.dendriteList[k].strength += learningRate
#						k -= 1
#					#opposite of neuron.setBias(1/(1+(pow(EULER, (0.0 - (neuron.getBias() + previousNeuron.getBias()))))))
#					#so set threshold to adjust in the direction of difference by a factor of learning rate
#					forwardNeuron.setThreshold(forwardNeuron.threshold + ((neuron.threshold - forwardNeuron.threshold) * learningRate))
#			j = j + 1
#	#At this point, a check against their satisfiers would be appropriate. satisfiers is to remain underscored until this value is used.
#	
#	layerList.invert() ##now back to the right way round
	

#func _init(layerCount,inputCount,outputCount):
#	for n in layerCount:
#		var la = []
#		if n == 0:
#			#reserved for input neurons
#			la = Layer.new(inputCount,0) #the number of input neurons
#		elif n == layerCount: #else if. Not "file" backwards, brain... you so silly.
#			#reserved for output neurons
#			la = Layer.new(outputCount, la.count()) #the number of output neurons
#		else:
#			if (la.size() >= 1):
#				la = Layer.new(5, la.count()) #the number of hidden layer neurons. 
#			else:
#				la = Layer.new(5, inputCount) #the number of hidden layer neurons. 
#		layerList.append(la)

#Genome crossover(Genome parent2) {
	#Genome child = new Genome(inputs, outputs, true);
	#child.genes.clear();
	#child.nodes.clear();
	#child.layers = layers;
	#child.nextNode = nextNode;
	#child.biasNode = biasNode;
	#ArrayList<connectionGene> childGenes = new ArrayList<connectionGene>();//list of genes to be inherrited form the parents
	#ArrayList<Boolean> isEnabled = new ArrayList<Boolean>(); 
	#//all inherrited genes
	#for (int i = 0; i< genes.size(); i++) {
	  #boolean setEnabled = true;//is this node in the chlid going to be enabled

	  #int parent2gene = matchingGene(parent2, genes.get(i).innovationNo);
	  #if (parent2gene != -1) {//if the genes match
		#if (!genes.get(i).enabled || !parent2.genes.get(parent2gene).enabled) {//if either of the matching genes are disabled

		  #if (random(1) < 0.75) {//75% of the time disabel the childs gene
			#setEnabled = false;
		  #}
		#}
		#float rand = random(1);
		#if (rand<0.5) {
		  #childGenes.add(genes.get(i));

		  #//get gene from this fucker
		#} else {
		  #//get gene from parent2
		  #childGenes.add(parent2.genes.get(parent2gene));
		#}
	  #} else {//disjoint or excess gene
		#childGenes.add(genes.get(i));
		#setEnabled = genes.get(i).enabled;
	  #}
	  #isEnabled.add(setEnabled);
	#}
#https://github.com/Code-Bullet/Asteroids-with-NEAT/blob/master/asteroidsGameNeat/Genome.pde
