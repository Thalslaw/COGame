extends Node2D

#Population
const nanobot = preload("res://NanotechAssets/Entity.tscn")

#PopulationSorter
onready var ySort = $YSort

# Called when the node enters the scene tree for the first time.
func _ready():
	var newBot = nanobot.instance()
	ySort.add_child(newBot)
	newBot.connect("spawn", self, "_on_Nanobot_spawn")
	newBot.isPlayer = true
	var camera = newBot.get_node("gameCamera")
	camera.current = true
	
	newBot = nanobot.instance()
	newBot.global_position.x = newBot.global_position.x + 1
	ySort.add_child(newBot)
	newBot.connect("spawn", self, "_on_Nanobot_spawn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func spawnNanobot(location):
#	var newBot = nanobot.instance()
#	newBot.global_position = location


func _on_Nanobot_spawn(location):
	var newBot = nanobot.instance()
	newBot.global_position = location
	ySort.add_child(newBot)
	newBot.connect("spawn", self, "_on_Nanobot_spawn")
	#try this!
