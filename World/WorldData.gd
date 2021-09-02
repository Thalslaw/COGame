extends Node2D

#The purpose of this autoload singleton is to hub and parse data to and from the game.

var listOfVillagers = []
var listOfWorldTasks = []

func addVillager(villager):
	listOfVillagers.append(villager)

# Called when the node enters the scene tree for the first time.
func _ready():
	#do things from the list of the world tasks.

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
