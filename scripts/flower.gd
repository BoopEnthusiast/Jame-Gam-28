extends StaticBody3D

func _process(delta):
	grow(0.09 * delta)

func grow(amount: float):
	scale.y += amount

func damage(dp: int):
	Singleton.flower_health -= dp

func get_size() -> float:
	return scale.y
