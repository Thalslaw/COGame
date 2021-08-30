extends Area2D

var isTasty = null

func smell_noms():
	return isTasty != null

func _on_HuntZone_body_entered(body):
	isTasty = body


func _on_HuntZone_body_exited(_body):
	#body is not used in this function. It is to remain underscored until it is used.
	isTasty = null
