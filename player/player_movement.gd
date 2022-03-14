extends Node2D

class_name PlayerMovement

const MAX_SPEED := 220
const ACCELERATION_WEIGHT := 0.2
const FRICTION_WEIGHT := 0.2

const JUMP_SPEED := 520
const MAX_FALL_SPEED := 500
const FALL_ACCELERATION = 20

var _velocity = Vector2.ZERO

var _player: KinematicBody2D
var _player_facing: PlayerFacing


func _init(player: KinematicBody2D, player_facing: PlayerFacing):
	_player = player
	_player_facing = player_facing


func _physics_process(_delta):
	var horizontal_movement = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)

	_velocity.x = lerp(_velocity.x, horizontal_movement * MAX_SPEED, ACCELERATION_WEIGHT)
	_velocity.y = min(MAX_FALL_SPEED, _velocity.y + FALL_ACCELERATION)
	if _player.is_on_floor() and Input.is_action_just_pressed("ui_up"):
		_velocity.y = -JUMP_SPEED

	_player_facing.set_by_velocity(_velocity)
	_velocity = _player.move_and_slide(_velocity, Vector2.UP)
