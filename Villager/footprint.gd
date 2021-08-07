extends Node2D

onready var pathTileMap	= $Path_Tile
export var TIMER = 32 #seconds

#get yo goot fetish worked out here
#entity moves, drops a thing, thing gets it's own position
#then thing talks to other things on spawn to make it work somehow
#then building things signal hurtboxes on collision for some reason? idk

func _process(delta):
	#they decay over time
	TIMER -= delta
	#reinforcing the footprint with more signals reinforces the timer

	#if ():
	#if they reach up to a threshold, they make a path where they are
		#pathTileMap.set_cellv(HERE, 0)

	if(TIMER <= 0):
	#if timer expires, footprint poofs.
		queue_free()
