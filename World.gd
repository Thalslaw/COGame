extends Node2D

const DISTANCE = 500

var borders = Rect2(1,1,20,20)

onready var cliffTileMap = $Cliff_Tile
onready var pathTileMap	= $Path_Tile
const grazz = preload("res://Action RPG Resources/World/Grass.tscn")

func _ready():
	randomize()
	generate_Cliffs()
	generate_Paths()	
	generate_Grazz()

func generate_Grazz():
	var walker = Walker.new(Vector2(10,10), borders)
	var map = walker.walk(DISTANCE)
	walker.queue_free()
	for location in map:
		if randf() >= 0.9:
			var grass = grazz.instance()
			add_child(grass)
			grass.global_position = location
	
func generate_Cliffs():
	var walker = Walker.new(Vector2(10,10), borders)
	var map = walker.walk(DISTANCE)
	walker.queue_free()
	for location in map:
		cliffTileMap.set_cellv(location, -1)
	cliffTileMap.update_bitmask_region(borders.position, borders.end)

func generate_Paths():
	var walker = Walker.new(Vector2(10,10), borders)
	var map = walker.walk(DISTANCE)
	walker.queue_free()
	for location in map:
		pathTileMap.set_cellv(location, 0)
	pathTileMap.update_bitmask_region(borders.position, borders.end)
