extends AnimatedSprite


func _ready():
	var loggable = connect("animation_finished", self, "_on_animation_finished")
	frame = 0
	play("deding")

func _on_animation_finished():
	queue_free()
