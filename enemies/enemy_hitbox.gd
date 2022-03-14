extends Area2D

export(NodePath) var enemy_path

onready var _enemy := get_node(enemy_path) as Enemy


func _on_Hitbox_area_entered(area: Area2D):
	if area.is_in_group("end"):
		_enemy.fell_in_the_end()
	if area.is_in_group("projectiles"):
		var parent = area.get_parent()
		if parent.damage is int:
			_enemy.was_shot(parent.damage)
