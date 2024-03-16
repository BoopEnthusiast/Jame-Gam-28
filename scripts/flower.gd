extends StaticBody3D

@onready var head = $Head
var health: float = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_grow(0.09 * delta)

func _grow(amount: float):
	scale.y += amount

func _damage(dp: float):
	health -= dp

func _get_health() -> float:
	return health
