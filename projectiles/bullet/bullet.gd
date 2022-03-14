extends KinematicBody2D

class_name Bullet

export(Vector2) var velocity
export(int) var damage = 1


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		print('hit')
		queue_free()


func hit_something():
	queue_free()
