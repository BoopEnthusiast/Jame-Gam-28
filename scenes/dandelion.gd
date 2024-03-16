extends "res://scripts/tower.gd"
class_name dandelion_tower

func _ready():
	_get_range_area3d().connect("area_entered", _on_collision)

func _on_collision(collider):
	pass

func _process(_delta):
	pass
