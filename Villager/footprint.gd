extends Node2D

onready var trackListener = $FootprintListener
var worldData = WorldData

export var TIMER = 30 #seconds
export var THRESHOLD = 60
var timer = TIMER

func _ready():
	self.global_position.x -= fmod(self.global_position.x,16.0)
	self.global_position.y -= fmod(self.global_position.y,16.0)

func _process(delta):
	
	#they decay over time
	timer -= delta
	#reinforcing the footprint with more signals reinforces the timer

	#if ():
	#if they reach up to a threshold, they make a path where they are
		#pathTileMap.set_cellv(HERE, 0)

	if(timer <= 0):
		#if timer expires, poof
		queue_free()



func _on_FootprintListener_body_entered(_body):
	timer += TIMER
	if(timer >= THRESHOLD):
		#Make the world issue a path here. This may be a bit complicated
		get_parent().get_parent().addPathTile(self.global_position)
		queue_free()


func _on_Footprint_MakePath():
	pass # Replace with function body.
