extends Area2D

var isInteresting = null

func seems_Interesting():
	return isInteresting != null

func _on_ActionZone_body_entered(body):
	isInteresting = body

func _on_ActionZone_body_exited(_body):
	#Body is to remain underscored until this value is used.
	isInteresting = null

