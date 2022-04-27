extends Node2D


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
