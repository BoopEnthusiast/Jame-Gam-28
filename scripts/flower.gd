extends StaticBody3D

var health: float = 100

func _process(delta):
	_grow(0.09 * delta)

func _grow(amount: float):
	scale.y += amount

func _damage(dp: float):
	health -= dp

func _get_health() -> float:
	return health

func _get_size() -> float:
	return scale.y
