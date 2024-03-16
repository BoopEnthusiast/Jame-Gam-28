extends Camera3D

# Make variables
var camera_rotation := Vector2(0, 0)
var mouse_sensitivity := 0.005

# Get player
@onready var player = $".."


func _ready() -> void:
	# Remove the mouse from the screen and just capture its movement
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event) -> void:
	# If escape is pressed reveal the mouse
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	# Get the mouse movement
	if event is InputEventMouseMotion:
		# Get how much the mouse has moved and pass it onto the camera_look function
		var relative_position = event.relative * mouse_sensitivity
		camera_look(relative_position)

# Rotate the camera
func camera_look(movement: Vector2) -> void:
	# Add how much the camera has moved to the camera rotation
	camera_rotation += movement
	# Stop the player from making the camera go upside down by looking too far up and down
	camera_rotation.y = clamp(camera_rotation.y, deg_to_rad(-90), deg_to_rad(90))
	
	# Reset the transform basis
	player.transform.basis = Basis()
	transform.basis = Basis()
	
	# Finally rotate the object, the player and camera needs to rotate on the x and only the camera should rotate on the y
	player.rotate_object_local(Vector3.UP, -camera_rotation.x)
	rotate_object_local(Vector3.RIGHT, -camera_rotation.y)
