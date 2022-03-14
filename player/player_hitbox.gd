extends Area2D

export(NodePath) var player_path

onready var _player := get_node(player_path) as Player


func _on_Hitbox_area_entered(area: Area2D):
	if area.is_in_group("enemies"):
		_player.die()
	elif area.is_in_group("end"):
		_player.die()
	elif area.is_in_group("projectiles"):
		_player.die()
	elif area.is_in_group("boxes"):
		_player.take_box()
