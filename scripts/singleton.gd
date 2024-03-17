extends Node

var player_health: int = 100
var flower_health: int = 100
var growth: float = 0
var water: int = 100


func _process(delta) -> void:
	growth += 1 * delta

func get_flower_health() -> int:
	return flower_health
