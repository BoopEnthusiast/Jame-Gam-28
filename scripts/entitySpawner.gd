extends Node

@onready var testEnemy = preload("res://scenes/testEnemy.tscn")
@export var SPAWN_DELAY_SECONDS: int
var time

func _ready():
	time = SPAWN_DELAY_SECONDS

func _process(delta):
	# Delay for the spawns
	if time <= 0:
		time = SPAWN_DELAY_SECONDS
		# Spawn the entity
		var instance = testEnemy.instantiate()
		instance.position.x = randf_range(-30, 30)
		instance.position.y = 5
		instance.position.z = randf_range(-30, 30)
		get_tree().root.add_child(instance)
	else: time -= delta
