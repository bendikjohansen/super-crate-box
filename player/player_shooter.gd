extends Node2D

class_name PlayerShooter

var weapon
var _player_facing: PlayerFacing
var _weapon_server: WeaponServer


func _init(weapon_, player_facing: PlayerFacing, weapon_server: WeaponServer):
	_player_facing = player_facing
	weapon = weapon_
	_weapon_server = weapon_server


func _ready():
	add_child(weapon)


func _process(_delta):
	if Input.is_action_pressed("shoot"):
		var direction = Vector2.RIGHT if _player_facing.facing_right else Vector2.LEFT
		var from = direction * 24
		weapon.shoot(from, direction)


func get_new_weapon():
	var new_weapon = _weapon_server.request_weapon().instance()
	while new_weapon.name == weapon.name:
		new_weapon = _weapon_server.request_weapon().instance()

	_change_to(new_weapon)


func _change_to(new_weapon: Weapon):
	weapon.queue_free()
	weapon = new_weapon
	add_child(new_weapon)
