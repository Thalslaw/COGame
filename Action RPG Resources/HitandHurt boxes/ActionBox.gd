extends Area2D

var iframes = false setget set_iframes
onready var timer = $Timer

signal Invinc_start
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

func _on_Timer_timeout():
	self.iframes = false

func _on_Hurtbox_Invinc_start():
	set_deferred("monitorable", false)

func _on_Hurtbox_invinc_end():
	monitorable = true

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
