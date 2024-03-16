extends StaticBody3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale.y += 9 * delta
