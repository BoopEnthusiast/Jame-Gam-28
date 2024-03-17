extends "res://scripts/tower.gd"

@onready var timer = $Timer
@onready var rangearea = $Range
var searching := true

func _physics_process(_delta):
	if searching:
		for body in rangearea.get_overlapping_bodies():
			if body is enemy:
				body.damage(1000)
				timer.start()
				searching = false
				break


func _on_timeout():
	searching = true
