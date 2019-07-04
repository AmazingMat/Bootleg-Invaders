extends Area2D

signal hit

export (PackedScene) var Projectile
export (PackedScene) var ProjectileBoundary
export var move_x = 100
export var speed = 100
var screen_size

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position += Vector2(move_x, 0)
	if Input.is_action_pressed("ui_left"):
		position += Vector2(-move_x, 0)
	if Input.is_action_pressed("ui_accept") && $ShootingCooldown.is_stopped():
		$ShootingCooldown.start()
		var projectile = Projectile.instance()
		add_child(projectile)
		projectile.position = $PlayerSpaceShip/ProjectilePosition.position
		projectile.linear_velocity = Vector2(0, speed)
	position.x = clamp(position.x, 20, screen_size.x-20)
	position.y = clamp(position.y, 0, screen_size.y)

func _on_PlayerSpaceShip_body_entered(body):
	hide() # Players disappears after being hit
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	queue_free()
	print_debug(body.name)
