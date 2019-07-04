extends RigidBody2D

signal hit
var Y_Transform
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func start(pos):
	position = pos
	show()

func _on_Projectile_body_entered(body):
	hide() # Players disappears after being hit
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	queue_free()
	print_debug(body.name)
