extends Node2D

const DISTANCE = 25

var borders = Rect2(1,1,18,18) ## keep these within the bounds of the tile, for use with large objects
var bigBorders = Rect2(1,1,36,36) ## keep these twice the size of borders, for use with small objects

onready var cliffTileMap = $Cliff_Tile
onready var pathTileMap	= $Path_Tile
onready var things = $Things
const grazz = preload("res://Action RPG Resources/World/Grass.tscn")

func _ready():
	randomize()
	generate_Cliffs()
	generate_Paths()	
	generate_Grazz()
	generate_Exits()
	
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
