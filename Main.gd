extends Node2D

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	if ($PlayerSpaceShip.position != $PlayerShipPosition.position):
		print_debug("Correcting PlayerSapceShip position!")
		$PlayerSpaceShip.start($PlayerShipPosition.position)
