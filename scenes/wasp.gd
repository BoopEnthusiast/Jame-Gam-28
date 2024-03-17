extends "res://scripts/baseEnemy.gd"

@onready var rangeArea = $Range
@export var HEALING_POWER: int
var pos: Vector3
var searching = true

func _physics_process(delta):
	for body in rangeArea.get_overlapping_bodies():
		if body is enemy:
			pos = body.position
			body.call("heal", HEALING_POWER * delta)
	# Move towards the flower
	move_to(pos)
	
	# Damage the flower if colliding
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "Flower":
			collision.get_collider().call("damage", 10.0)
			get_parent().remove_child(self)
			return
	move_and_slide()
