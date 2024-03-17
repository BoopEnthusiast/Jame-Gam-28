extends "res://scripts/tower.gd"

var seed_scene = preload("res://scenes/dandelion_projectile.tscn")
@onready var rangeArea = $Range
@onready var timer = $Timer
var searching := true
@onready var with_head_mesh = $Dandelion_lvl_32
@onready var without_head_mesh = $Dandielion_lvl_3_headless

func _physics_process(_delta) -> void:
	if searching:
		for body in rangeArea.get_overlapping_bodies():
			if body is enemy:
				searching = false
				without_head_mesh.visible = true
				with_head_mesh.visible = false
				var new_seed: Area3D = seed_scene.instantiate()
				get_parent().add_child(new_seed)
				new_seed.target = body
				new_seed.global_position = global_position
				timer.start()
				return


func _on_timeout():
	searching = true
	without_head_mesh.visible = false
	with_head_mesh.visible = true
