extends "res://scripts/tower.gd"

@onready var head = $Head
@onready var cooldown: Timer = $FireCooldown

var bodies = []

func _process(_delta):
	var body = bodies[0]
	print(body)
	if body is enemy and cooldown.is_stopped():
		head.look_at(body.global_position)
		body.call("damage", damage_points)
		cooldown.start()

func _on_range_body_entered(body):
	bodies.append(body)


func _on_range_body_exited(body):
	bodies.erase(body)
