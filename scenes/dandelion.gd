extends "res://scripts/tower.gd"
class_name dandelion_tower

func _process(_delta):
	pass


func _on_range_area_entered(area):
	if area.collision_layer == 2:
		if area is enemy:
			area.call("damage", 100)
