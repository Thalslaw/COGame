extends KinematicBody2D

const Batded = preload("res://Action RPG Resources/Effects/Batded.tscn")

export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200

enum{
	IDLE,
	WANDER,
	CHASE
}

var knockback = Vector2.ZERO
var velocity = Vector2.ZERO
onready var stats = $Stats
onready var Hunting = $HuntZone
onready var bat = $Batty
onready var batHurt = $Hurtbox
var state = CHASE



func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			hungry()
		
		WANDER:
			pass
		CHASE:
			var food = Hunting.isTasty
			if food != null:
				var chase = (food.global_position - global_position).normalized()
				velocity = velocity.move_toward(chase * MAX_SPEED, ACCELERATION * delta)
				bat.flip_h = velocity.x < 0
			else:
				state = IDLE
	
	
	velocity = move_and_slide(velocity)
	
func hungry():
	if Hunting.smell_noms():
		state = CHASE


func _on_Hurtbox_area_entered(area):
	knockback = area.knockback_vector * 120
	stats.health -= area.damage
	batHurt.create_flash()


func _on_Stats_no_hp():
	var batdie = Batded.instance()
	get_parent().add_child(batdie)
	batdie.global_position = global_position
	queue_free()
