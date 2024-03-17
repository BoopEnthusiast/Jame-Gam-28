extends "res://scripts/baseEnemy.gd"

@onready var rangeArea = $Range
@export var HEALING_POWER: int
var pos: Vector3

func _physics_process(delta):
	# Get the target location
	pos = get_parent().get_node("Flower").position
	for body in rangeArea.get_overlapping_bodies():
		if body is enemy:
			pos = body.position
			body.call("heal", HEALING_POWER * delta)
	
	# Hover above the ground
	pos.y += 2
	
	# Move towards the flower
	move_to(pos)
	
	move_and_slide()
