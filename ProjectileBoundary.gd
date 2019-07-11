extends Area2D

signal hit

func _on_ProjectileBoundary_body_entered(body):
	print_debug(body.name)
	body.queue_free()
	emit_signal("hit")
	
