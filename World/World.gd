extends Node2D

const DISTANCE = 25

var borders = Rect2(1,1,18,18) ## keep these within the bounds of the tile, for use with large objects
var bigBorders = Rect2(1,1,36,36) ## keep these twice the size of borders, for use with small objects

onready var cliffTileMap = $Cliff_Tile
onready var pathTileMap	= $Path_Tile
onready var things = $Things
const grazz = preload("res://Action RPG Resources/World/Grass.tscn")

enum {VALLEY, VILLAGE, DUNGEON, DWELLING}
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
		generate_Cliffs()
		generate_Paths()	
		generate_Grazz()
		generate_Exits()
	elif(environment == VILLAGE):
		#the same as a valley but with dwellings
		pass
	elif(environment == DUNGEON):
		#make a dungeon!
		pass
	elif(environment == DWELLING):
		#the same as a dungeon but with dwelling dressing... people live here!
		pass
	
func generate_Exits():
	##the purpose of this is to give the tile some exits that can be reached by the playable area.
	var walker = Walker.new(Vector2(9,18), borders)
	var map = walker.walk(DISTANCE)
	walker.position = Vector2(18,9)
	map = walker.walk(DISTANCE)
	walker.position = Vector2(1,9)
	map = walker.walk(DISTANCE)
	walker.position = Vector2(9,1)
	map = walker.walk(DISTANCE)
	walker.queue_free()
	for location in map:
		cliffTileMap.set_cellv(location, -1)
	cliffTileMap.update_bitmask_region(borders.position, borders.end)
	#TODO next search for some south facing cliffs to shove cave entrances on

func generate_Grazz():
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
	
func generate_Cliffs():
	var walker = Walker.new(Vector2(9,9), borders)
	var map = walker.walk(DISTANCE)
	walker.queue_free()
	for location in map:
		cliffTileMap.set_cellv(location, -1)
	cliffTileMap.update_bitmask_region(borders.position, borders.end)

func generate_Paths():
	var walker = Walker.new(Vector2(36,36), bigBorders)
	var map = walker.walk(DISTANCE)
	walker.queue_free()
	for location in map:
		if (cliffTileMap.get_cellv(location/2) == -1):
			pathTileMap.set_cellv(location, 0)
	pathTileMap.update_bitmask_region(bigBorders.position, bigBorders.end)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#decrement a timer by delta.
	#every timer loop, take the top global location in the list, and advance it as many time steps since its last elapse.
	#move thing from the top of the list to the bottom of the list, reset the timer.
	pass
