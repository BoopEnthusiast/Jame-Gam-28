extends Node

@onready var testEnemy = preload("res://scenes/testEnemy.tscn")
@export var START_SPAWN_DELAY_SECONDS: int
var timerRestartTime
var timer

func _ready():
	timer = START_SPAWN_DELAY_SECONDS
	timerRestartTime = START_SPAWN_DELAY_SECONDS

func get_positions(side: int) -> Vector4:
	match side:
		0: # Right side
			return Vector4(-80, -86, 25, -88)
		1: # Left side
			return Vector4(85, 82, 38, -78)
	return Vector4(0, 0, 0, 0)

func _process(delta):
	# Delay for the spawning
	if timer <= 0:
		if timerRestartTime > 0.05:
			timerRestartTime -= 4.5 * 0.016666666
		else:
			timerRestartTime = 0.05
		timer = timerRestartTime
		# Spawn the entity
		var instance = testEnemy.instantiate()
		var pos: Vector4 = get_positions(randi_range(0, 1))
		instance.position.x = randf_range(pos.x, pos.y)
		instance.position.y = 5
		instance.position.z = randf_range(pos.z, pos.w)
		get_parent().add_child(instance)
	else: timer -= delta
