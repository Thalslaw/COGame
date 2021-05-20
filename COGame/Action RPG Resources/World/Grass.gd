extends Node2D

const Grassdie = preload("res://Action RPG Resources/Effects/Grassded.tscn")

func create_dedgrass():
	var GrassDed = Grassdie.instance()
	get_parent().add_child(GrassDed)
	GrassDed.global_position = global_position

func _on_Hurtbox_area_entered(area):
	create_dedgrass()
	queue_free()
