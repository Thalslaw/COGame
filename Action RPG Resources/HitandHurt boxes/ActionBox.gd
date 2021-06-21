extends Area2D

var isInteresting = null

func seems_Interesting():
	return isInteresting != null

func _on_ActionZone_body_entered(body):
	isInteresting = body

func _on_ActionZone_body_exited(body):
	isInteresting = null

