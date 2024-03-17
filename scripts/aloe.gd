extends "res://scripts/tower.gd"


func _on_timeout():
	Singleton.flower_health += 0.1
	timer.start()
