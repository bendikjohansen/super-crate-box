extends Area2D

class_name BoxHitbox

signal was_picked_up


func _on_Box_area_entered(area: Area2D):
	if area.is_in_group("players"):
		emit_signal("was_picked_up")
