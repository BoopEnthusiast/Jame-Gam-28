extends Area3D

const SPEED = 8

var target: enemy
var seed_area_scene := preload("res://scenes/seed_area.tscn")
var level


func _physics_process(delta):
	if target != null:
		if target.is_inside_tree(): global_position += global_position.direction_to(target.collider.global_position) * delta * SPEED
		else: queue_free()
	else: queue_free()
	for body in get_overlapping_bodies():
		if body is enemy:
			var new_seed_area = seed_area_scene.instantiate()
			new_seed_area.level = level
			get_tree().root.add_child(new_seed_area)
			new_seed_area.global_position = global_position
			queue_free()
