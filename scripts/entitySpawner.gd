extends Node

@onready var testEnemy = preload("res://scenes/testEnemy.tscn")

func _process(_delta):
	# Spawn the entity
	var instance = testEnemy.instantiate()
	instance.position.x = randf_range(-30, 30)
	instance.position.y = 5
	instance.position.z = randf_range(-30, 30)
	get_tree().root.add_child(instance)
