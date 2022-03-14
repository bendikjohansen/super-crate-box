extends Node2D

class_name EnemyMovement

const WALK_SPEED = 150

const MAX_FALL_SPEED = 300
const FALL_ACCELERATION = 15

var _velocity: Vector2

var _enemy: KinematicBody2D


func _init(enemy: KinematicBody2D, direction: Vector2):
	assert(
		direction == Vector2.LEFT or direction == Vector2.RIGHT, "direction should be left or right"
	)
	_enemy = enemy
	_velocity = direction * WALK_SPEED

	if direction == Vector2.LEFT:
		flip_enemy()


func _physics_process(_delta):
	_velocity.y = min(MAX_FALL_SPEED, _velocity.y + FALL_ACCELERATION)
	var new_velocity = _enemy.move_and_slide(_velocity, Vector2.UP)

	if _enemy.is_on_wall():
		_velocity.x *= -1
		flip_enemy()
	else:
		_velocity = new_velocity


func flip_enemy():
	_enemy.apply_scale(Vector2(-1, 1))
