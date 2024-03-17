extends Area3D

@onready var timer = $Timer
@export var damage: float = 55
var level = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()


func _process(delta):
	for enemyy in get_overlapping_bodies():
		if enemyy is enemy:
			print(enemyy.health)
			enemyy.damage(damage * delta,level)


func _on_timeout():
	queue_free()
