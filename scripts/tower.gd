extends StaticBody3D
class_name Tower

@export var damage_points: int
@onready var range: Area3D = $Range
@onready var range_collider: CollisionShape3D = $Range/Collider

func _set_damage_points(dp: int):
	damage_points = dp

func _get_damage_points() -> bool:
	return damage_points

func _get_range_area3d() -> Area3D:
	return range

func _get_range_collider() -> CollisionShape3D:
	return range_collider
