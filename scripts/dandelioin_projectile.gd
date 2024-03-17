extends Area3D

var target
var seed_area_scene := preload("res://scenes/seed_area.tscn")


func _physics_process(delta):
	if target != null:
		global_position += global_position.direction_to(target.global_position)
	else:
		queue_free()
	
	for body in get_overlapping_bodies():
		print(body)
		if body is enemy:
			print("Hello found you")
			var new_seed_area = seed_area_scene.instantiate()
			get_tree().root.add_child(new_seed_area)
			new_seed_area.global_position = global_position
			queue_free()
