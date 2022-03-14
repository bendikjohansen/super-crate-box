extends Resource

class_name PlayerFacing

onready var facing_right := true

func set_by_velocity(vel: Vector2):
	facing_right = true if vel.x > 0 else false if vel.x < 0 else facing_right
