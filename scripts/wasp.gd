extends "res://scripts/baseEnemy.gd"

var pos: Vector3
@onready var death_area = $DeathArea


func _physics_process(delta):
	# Get the target location
	pos = get_parent().get_node("Flower").position
	
	# Hover above the ground
	pos.y += 2
	
	# Move towards the flower
	move_to(pos)
	
	move_and_slide()
	
	var overlapping_bodies: Array[Node3D] = death_area.get_overlapping_bodies()
	if overlapping_bodies.has(get_parent().get_node("Flower")):
		health -= 1000
