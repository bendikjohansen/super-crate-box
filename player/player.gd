extends KinematicBody2D

class_name Player

export(PackedScene) var InitialWeapon
export(NodePath) var weapon_server_path

signal died

onready var facing_right := PlayerFacing.new()
onready var _player_shooter := PlayerShooter.new(
	InitialWeapon.instance(), facing_right, get_node(weapon_server_path) as WeaponServer
)


func _ready():
	add_child(PlayerMovement.new(self, facing_right))
	add_child(_player_shooter)


func die():
	emit_signal("died")
	queue_free()


func take_box():
	_player_shooter.get_new_weapon()
