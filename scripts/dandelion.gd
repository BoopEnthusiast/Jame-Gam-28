extends "res://scripts/tower.gd"

var seed_scene = preload("res://scenes/dandelion_projectile.tscn")


func _on_range_body_entered(body):
	if body is enemy:
		var new_seed: Area3D = seed_scene.instantiate()
		get_parent().add_child(new_seed)
		new_seed.target = body
		new_seed.global_position = global_position
