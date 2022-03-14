extends Timer

onready var ready := true


func start_cooldown():
	ready = false
	start()


func _on_Cooldown_timeout():
	ready = true
