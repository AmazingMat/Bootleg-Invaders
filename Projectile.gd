extends RigidBody2D

signal hit
var Y_Transform

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_Projectile_body_entered(body):
	hide() # Players disappears after being hit
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	queue_free()
