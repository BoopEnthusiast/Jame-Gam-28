extends Area3D

@onready var timer = $Timer
@export var damage: float = 45


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()


func _process(delta):
	for enemyy in get_overlapping_bodies():
		if enemyy is enemy:
			enemyy.health -= damage * delta


func _on_timeout():
	queue_free()
