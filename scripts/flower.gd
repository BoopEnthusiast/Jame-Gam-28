extends StaticBody3D

@onready var head = $Head

# Called when the node enters the scene tree for the first time.
func _ready():
	scale = Vector3(1, 1, 1)
	head.position = Vector3(0, 1, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_grow(0.00009)

func _grow(amount: float):
	scale.y += amount
	head.position.y += amount
