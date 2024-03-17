extends "res://scripts/tower.gd"
class_name dandelion_tower


func _process(_delta):
	pass

func _on_range_body_entered(body):
	if body is enemy:
		body.call("damage", damage_points)
