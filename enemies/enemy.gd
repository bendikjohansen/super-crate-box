extends KinematicBody2D

class_name Enemy

export(bool) var go_right

signal fell_in_the_end(enemy)

export(int) var health = 2

func _ready():
	var direction = Vector2.RIGHT if go_right else Vector2.LEFT
	var enemy_movement = EnemyMovement.new(self, direction)
	add_child(enemy_movement)


func fell_in_the_end():
	emit_signal("fell_in_the_end", self)


func was_shot(damage: int):
	health -= damage
	if health <= 0:
		queue_free()
