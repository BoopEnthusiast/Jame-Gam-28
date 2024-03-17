extends "res://scripts/tower.gd"

@onready var head = $Head
@onready var cooldown: Timer = $FireCooldown

func _on_range_body_entered(body):
	if body is enemy and cooldown.is_stopped():
		head.look_at_from_position(body.position, Vector3.UP)
		body.call("damage", damage_points)
		cooldown.start()
