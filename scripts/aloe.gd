extends "res://scripts/tower.gd"

@onready var timer = $Timer


func _on_timeout():
	Singleton.flower_health += 0.1
	timer.start()
