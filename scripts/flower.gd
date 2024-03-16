extends StaticBody3D

@onready var head = $Head

# Called when the node enters the scene tree for the first time.
func _ready():
	scale = Vector3(1, 1, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(delta)
	_grow(9 * delta)

func _grow(amount: float):
	scale.y += amount
