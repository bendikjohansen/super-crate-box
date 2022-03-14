extends Node2D

export(PackedScene) var SmallEnemy
export(PackedScene) var BigEnemy

onready var group_timer := $GroupTimer
onready var individual_timer := $IndividualTimer

const MIN_GROUP_INTERVAL = 2
const MAX_GROUP_INTERVAL = 6
const MIN_GROUP_SIZE = 1
const MAX_GROUP_SIZE = 5

var enemies_to_spawn = 0
var group_go_right := false


func _on_IndividualTimer_timeout():
	if enemies_to_spawn:
		var enemy_type = BigEnemy if randf() < 0.2 else SmallEnemy
		spawn_enemy(enemy_type)
		enemies_to_spawn -= 1
	else:
		individual_timer.stop()
		group_timer.wait_time = rand_range(MIN_GROUP_INTERVAL, MAX_GROUP_INTERVAL)
		group_timer.start()


func _on_GroupTimer_timeout():
	enemies_to_spawn = randi() % MAX_GROUP_SIZE + MIN_GROUP_SIZE
	group_go_right = randf() > 0.5

	individual_timer.start()
	group_timer.stop()


func spawn_enemy(Enemy):
	var enemy = Enemy.instance()
	enemy.connect("fell_in_the_end", self, "_on_Enemy_fell_in_the_end")
	enemy.go_right = group_go_right
	add_child(enemy)


func _on_Enemy_fell_in_the_end(enemy: Enemy):
	enemy.position = Vector2.ZERO
