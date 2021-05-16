extends Node2D

export var max_health = 1 setget set_max_hp
var health = max_health setget set_hp

signal no_hp
signal hp_modified(value)
signal mhp_modified(value)

func set_max_hp(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("mhp_modified", max_health)

func set_hp(value):
	health = value
	emit_signal("hp_modified", health)
	if health <= 0:
		emit_signal("no_hp")

func _ready():
	self.health = max_health
