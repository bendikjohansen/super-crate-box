extends Node

class_name WeaponServer

export(Array) var weapons

func request_weapon():
	return weapons[randi() % len(weapons)]
