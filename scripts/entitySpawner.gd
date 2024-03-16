extends Node

@onready var testEnemy = preload("res://scenes/testEnemy.tscn")
@export var START_SPAWN_DELAY_SECONDS: int
var timerRestartTime
var timer

func _ready():
	timer = START_SPAWN_DELAY_SECONDS
	timerRestartTime = START_SPAWN_DELAY_SECONDS

func _process(delta):
	# Delay for the spawning
	if timer <= 0:
		if timerRestartTime > 0.5:
			timerRestartTime -= 4.5 * 0.016666666
		print(timerRestartTime)
		timer = timerRestartTime
		# Spawn the entity
		var instance = testEnemy.instantiate()
		instance.position.x = randf_range(-50, 80)
		instance.position.y = 5
		instance.position.z = randf_range(-90, 62)
		get_parent().add_child(instance)
	else: timer -= delta
