extends Node2D

export(NodePath) var spawnpoint_1
export(NodePath) var spawnpoint_2
export(NodePath) var spawnpoint_3
export(NodePath) var spawnpoint_4
export(NodePath) var spawnpoint_5
export(NodePath) var spawnpoint_6
export(PackedScene) var Box

onready var _box = Box.instance()
onready var _spawnpoints := [
	get_node(spawnpoint_1),
	get_node(spawnpoint_2),
	get_node(spawnpoint_3),
	get_node(spawnpoint_4),
	get_node(spawnpoint_5),
	get_node(spawnpoint_6)
]


func _ready():
	var spawn = _get_random_spawnpoint()
	_box.position = spawn.position
	_box.connect("was_picked_up", self, "_on_Box_was_picked_up")
	add_child(_box)


func _get_random_spawnpoint():
	return _spawnpoints[randi() % len(_spawnpoints)]


func _on_Box_was_picked_up():
	var spawn = _get_random_spawnpoint()
	while spawn.position == _box.position:
		spawn = _get_random_spawnpoint()

	_box.position = spawn.position
