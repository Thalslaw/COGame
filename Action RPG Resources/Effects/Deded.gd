extends AnimatedSprite


func _ready():
	var _loggable = connect("animation_finished", self, "_on_animation_finished")
	#loggable is to remain underscore until the variable is used.
	frame = 0
	play("deding")

func _on_animation_finished():
	queue_free()
