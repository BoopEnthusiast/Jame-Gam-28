extends "res://scripts/tower.gd"
class_name dandelion_tower

func _ready():
	get_range_area3d().connect("area_entered", on_collision)

func on_collision(collider):
	pass

func _process(_delta):
	pass
