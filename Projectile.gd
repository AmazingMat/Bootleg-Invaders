extends RigidBody2D

signal hit
export var velocity = Vector2(0, 10)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false