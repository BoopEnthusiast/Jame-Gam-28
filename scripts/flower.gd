extends StaticBody3D
class_name Flower


func grow(amount: float):
	scale.y += amount


func damage(dp: int):
	Singleton.flower_health -= dp


func get_size() -> float:
	return scale.y
