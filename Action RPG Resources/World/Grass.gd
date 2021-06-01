extends Node2D

const Grassdie = preload("res://Action RPG Resources/Effects/Grassded.tscn")
const Leef = preload("res://Action RPG Resources/World/Leaf.tscn")

func create_dedgrass():
	var GrassDed = Grassdie.instance()
	get_parent().add_child(GrassDed)
	GrassDed.global_position = global_position

func create_leef():
	var leef = Leef.instance()
	get_parent().add_child(leef)
	leef.global_position = global_position

func _on_Hurtbox_area_entered(area):
	create_dedgrass()
	create_leef()
	queue_free()
