extends Firearm


func fire(from_position: Vector2, direction: Vector2):
	var bullet = Bullet.instance()
	bullet.velocity = direction * bullet_speed
	bullet.position = global_position + from_position
	get_tree().root.add_child(bullet)
