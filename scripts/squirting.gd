extends "res://scripts/tower.gd"

@onready var plant = $Cucumber_lvl_3_textured/Cucumber_lvl_3

var bodies = []

func _process(_delta):
	if not bodies.is_empty():
		var body = bodies[0]
		if timer.is_stopped():
			plant.look_at(body.global_position)
			body.damage(damage_points, upgrade_level)
			timer.start()

func _on_range_body_entered(body):
	if body is enemy:
		bodies.append(body)

func _on_range_body_exited(body):
	if body is enemy:
		bodies.erase(body)
