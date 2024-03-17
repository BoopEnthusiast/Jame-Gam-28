extends Node

@onready var testEnemy = preload("res://scenes/testEnemy.tscn")
@onready var beetle = preload("res://scenes/beetle.tscn")
@onready var wasp = preload("res://scenes/wasp.tscn")
@onready var butterfly = preload("res://scenes/butterfly.tscn")
@onready var ant = preload("res://scenes/ant.tscn")
@export var START_SPAWN_DELAY_SECONDS: int
var timerRestartTime
var timer
var options = []

func _ready():
	options = [beetle, ant]
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
	# Spawn wasp when certin score reached
	if Singleton.score > 2 and wasp not in options:
		options.append(wasp)
	if Singleton.score > 3 and butterfly not in options:
		options.append(butterfly)
	# Delay for the spawning
	if timer <= 0:
		if timerRestartTime >= 0.1:
			timerRestartTime -= 4.5 * 0.016666666
		else:
			timerRestartTime = 0.1
		timer = timerRestartTime
		# Spawn the entity
		var instance = options[randi_range(0, options.size() - 1)].instantiate()
		var pos: Vector4 = get_positions(randi_range(0, 1))
		instance.position.x = randf_range(pos.x, pos.y)
		instance.position.y = 5
		instance.position.z = randf_range(pos.z, pos.w)
		get_parent().add_child(instance)
	else: timer -= delta
