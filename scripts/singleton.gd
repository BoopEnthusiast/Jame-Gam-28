extends Node

var player_health := 100
var flower_health := 100
var growth := 0


func _process(delta):
	growth += 1 * delta
