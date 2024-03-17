extends StaticBody3D
class_name Flower

var current_height = 0


func grow():
	if current_height < 14:
		position.y += 1
	else:
		scale.y += 0.1
		position.y += 1.45
	current_height += 1


func damage(dp: int):
	Singleton.flower_health -= dp


func get_size() -> float:
	return scale.y
