extends "res://scripts/tower.gd"

@onready var head = $Head
@onready var cooldown: Timer = $FireCooldown

var bodies = []

func _process(_delta):
	if not bodies.is_empty():
		var body = bodies[0]
		if cooldown.is_stopped():
			head.look_at(body.global_position)
			body.call("damage", damage_points)
			cooldown.start()

func _on_range_body_entered(body):
	if body is enemy:
		bodies.append(body)

func _on_range_body_exited(body):
	if body is enemy:
		bodies.erase(body)
