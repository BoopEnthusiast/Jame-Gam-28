extends Node

var player_health: int = 100
var flower_health: int = 100
var water: int = 100
var score: int = 0

func get_flower_health() -> int:
	return flower_health

func reset():
	player_health = 100
	flower_health = 100
	water = 100
