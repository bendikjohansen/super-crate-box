extends Weapon

class_name Firearm

export(PackedScene) var Bullet
export(float) var bullet_speed := 700.0

onready var cooldown = $Cooldown


func shoot(from_position: Vector2, direction: Vector2):
	if !cooldown.ready:
		return

	fire(from_position, direction)
	cooldown.start_cooldown()


func fire(_from_position: Vector2, _direction: Vector2):
	pass
