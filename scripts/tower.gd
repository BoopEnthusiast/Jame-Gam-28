extends StaticBody3D
class_name Tower

@export var damage_points: int
@onready var arearange: Area3D = $Range
@onready var range_collider: CollisionShape3D = $Range/Collider
@onready var timer: Timer = $Timer
@export var COST: int
var upgrade_level = 1

func set_damage_points(dp: int):
	damage_points = dp

func get_damage_points() -> bool:
	return damage_points

func get_range_area3d() -> Area3D:
	return arearange

func get_range_collider() -> CollisionShape3D:
	return range_collider

func upgrade():
	upgrade_level += 1
	timer.wait_time -= upgrade_level/1.85
