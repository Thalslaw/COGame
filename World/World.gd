extends Node2D

const DISTANCE = 25

var smolBorders = Rect2(1,1,9,9) ## for use with objects size 64
var borders = Rect2(1,1,18,18) ## keep these within the bounds of the tile, for use with objects size 32
var bigBorders = Rect2(1,1,36,36) ## keep these twice the size of borders, for use with objects size 16

onready var cliffTileMap = $Cliff_Tile
onready var pathTileMap	= $Path_Tile
onready var things = $Things
const grazz = preload("res://Action RPG Resources/World/Grass.tscn")
const roc = preload("res://Action RPG Resources/World/Rock.tscn")

enum {VALLEY, VILLAGE, DUNGEON, DWELLING}
## valley is notionally the default startpoint. Arranged this way in case we want to have different kinds of start point in the future.
var environment = VALLEY

func saveEnvironment():
	#turn this entire environment into a CSV file.
	pass

func loadEnvironment():
	#pass in global coords
	#get corresponding CSV file
	#turn CSV file into environment.
	pass

func _ready():
	randomize()
	if(environment == VALLEY):
		#make a valley zone
		var walker = Walker.new(Vector2(9,9), borders)
		var map = walker.walk(DISTANCE)
		walker.queue_free()
		for location in map:
			cliffTileMap.set_cellv(location, -1)
			cliffTileMap.update_bitmask_region(borders.position, borders.end)
		## TO DO in the perimeter of 'map', make some exit caves
		#generate_Paths() #this ought to be between the exit caves, so pass in the data.
		generate_Grazz() #dressings
	elif(environment == VILLAGE):
		#the same as a valley but with dwellings
		pass
	elif(environment == DUNGEON):
		#make a dungeon!
		pass
	elif(environment == DWELLING):
		#the same as a dungeon but with dwelling dressing... people live here!
		pass

func generate_Grazz(): #is 8x8 grid dummy!
	var walker = Walker.new(Vector2(36,36), bigBorders)
	var map = walker.walk(DISTANCE)
	walker.queue_free()
	for location in map:
		if (cliffTileMap.get_cellv(location/2) == -1):
			location = location*16
			if randf() >= 0.9:
				var grass = grazz.instance()
				#find the ysort, add the grass there
				things.add_child(grass)				
				grass.global_position = location
				
func generate_Roc():
	var walker = Walker.new(Vector2(36,36), bigBorders)
	var map = walker.walk(DISTANCE)
	walker.queue_free()
	for location in map:
		if (cliffTileMap.get_cellv(location/2) == -1):
			location = location*16
			if randf() >= 0.9:
				var pebble = roc.instance()
				#find the ysort, add the gr- sorry, stone there
				things.add_child(pebble)				
				pebble.global_position = location

func generate_Paths():
	#currently randomly walks, intent is to pass in locations to try to get between.
	#they probably shouldn't be perfectly optimised.
	var walker = Walker.new(Vector2(36,36), bigBorders)
	var map = walker.walk(DISTANCE)
	walker.queue_free()
	for location in map:
		if (cliffTileMap.get_cellv(location/2) == -1):
			pathTileMap.set_cellv(location, 0)
	pathTileMap.update_bitmask_region(bigBorders.position, bigBorders.end)

func _process(delta):
	#this will handle elapsing time within the game.
	#decrement a timer by delta.
	#everything in the current zone is loaded, therefore doesn't require processing.
	#computationally arranged:
	#every timer loop, take the top global location in the list, and advance it as many time steps since its last elapse.
		#
		#move thing from the top of the list to the bottom of the list, reset the timer.
	pass
