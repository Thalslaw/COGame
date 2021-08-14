extends Node2D

onready var trackListener = $FootprintListener

export var TIMER = 32 #seconds
export var THRESHOLD = 128
var timer = TIMER

#get yo goot fetish worked out here
#entity moves, drops a thing, thing gets it's own position
#then thing talks to other things on spawn to make it work somehow
#then building things signal hurtboxes on collision for some reason? idk

func _process(delta):
	
	#they decay over time
	timer -= delta
	#reinforcing the footprint with more signals reinforces the timer

	#if ():
	#if they reach up to a threshold, they make a path where they are
		#pathTileMap.set_cellv(HERE, 0)

	if(timer <= 0):
	#if timer expires, footprint poofs.
		queue_free()


func _on_FootprintListener_body_entered(body):
	timer += TIMER
	if(timer >= THRESHOLD):
		#Make the world issue a path here. This may be a bit complicated
		queue_free()
