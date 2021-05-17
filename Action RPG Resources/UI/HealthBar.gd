extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts
onready var liveHP = $livehp
onready var emptyHP = $emptyhp


func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if liveHP != null:
		liveHP.rect_size.x = hearts * 15
	

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if emptyHP != null:
		emptyHP.rect_size.x = max_hearts * 15

func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("hp_modified", self, "set_hearts")
	PlayerStats.connect("mhp_modified", self, "set_max_hearts")