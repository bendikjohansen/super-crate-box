extends KinematicBody2D

class_name Disk

export(Vector2) var velocity

var damage = 5
var bounces_left = 2

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		bounces_left -= 1
		velocity *= -1

		if !bounces_left:
			queue_free()
