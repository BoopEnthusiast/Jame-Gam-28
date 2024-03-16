extends StaticBody3D

var health: float = 100

func _process(delta):
	grow(0.09 * delta)

func grow(amount: float):
	scale.y += amount

func damage(dp: float):
	health -= dp

func get_health() -> float:
	return health

func _et_size() -> float:
	return scale.y
