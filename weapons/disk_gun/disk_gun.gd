extends Weapon

export(PackedScene) var Disk
export(float) var bullet_speed := 700.0

var _can_shoot = true


func shoot(from_position: Vector2, direction: Vector2):
	if !_can_shoot:
		return

	fire(from_position, direction)
	_can_shoot = false


func fire(from_position: Vector2, direction: Vector2):
	var disk = Disk.instance()
	disk.connect("tree_exited", self, "_on_Disk_tree_exited")
	disk.velocity = direction * bullet_speed
	disk.position = global_position + from_position
	get_tree().root.add_child(disk)

func _on_Disk_tree_exited():
	_can_shoot = true
