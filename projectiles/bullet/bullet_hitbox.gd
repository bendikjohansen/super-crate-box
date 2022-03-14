extends Area2D

class_name BulletHitbox

export(NodePath) var bullet_path

onready var _bullet := get_node(bullet_path) as Bullet


func _on_Hitbox_area_entered(_area: Area2D):
	_bullet.hit_something()
