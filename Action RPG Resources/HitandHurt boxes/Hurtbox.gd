extends Area2D

const Hitted = preload("res://Action RPG Resources/Effects/Hitted.tscn")

var iframes = false setget set_iframes

onready var timer = $Timer

signal invinc_start
signal invinc_end

func set_iframes(value):
	iframes = value
	if iframes == true:
		emit_signal("invinc_start")
	else:
		emit_signal("invinc_end")

func start_iframes(duration):
	self.iframes = true
	timer.start(duration)

func create_flash():
	var hit = Hitted.instance()
	var main = get_tree().current_scene
	main.add_child(hit)
	hit.global_position = global_position - Vector2()


func _on_Timer_timeout():
	self.iframes = false


func _on_Hurtbox_invinc_start():
	set_deferred("monitorable", false)


func _on_Hurtbox_invinc_end():
	monitorable = true
