extends "res://scripts/tower.gd"


func _process(delta) -> void:
	print(Singleton.flower_health)
	Singleton.flower_health += 0.1 * delta
