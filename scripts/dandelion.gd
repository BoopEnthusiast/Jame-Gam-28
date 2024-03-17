extends "res://scripts/tower.gd"

var seed_scene = preload("res://scenes/dandelion_projectile.tscn")
@onready var rangeArea = $Range
@onready var timer = $Timer
var searching := true

func _physics_process(_delta) -> void:
	if searching:
		for body in rangeArea.get_overlapping_bodies():
			if body is enemy:
				searching = false
				var new_seed: Area3D = seed_scene.instantiate()
				get_parent().add_child(new_seed)
				new_seed.target = body
				new_seed.global_position = global_position
				timer.start()
				return


func _on_timeout():
	searching = true
