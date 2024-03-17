extends "res://scripts/tower.gd"


func _process(delta) -> void:
	Singleton.flower_health += 0.1 * delta
