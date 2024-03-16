extends RayCast3D

# Get nodes
var ground_node: StaticBody3D
@onready var player := $".."

# Preload scenes to spawn
var test_tower = preload("res://scenes/test_tower.tscn")


# Get the ground node
func _ready() -> void:
	ground_node = get_node("../../../Ground")


# Interact with objects
func _physics_process(_delta) -> void:
	if Input.is_action_just_pressed("interact") and is_colliding():
		var interacted_object: Object = get_collider()
		if interacted_object == ground_node:
			var new_tower: StaticBody3D = test_tower.instantiate()
			ground_node.add_child(new_tower)
			new_tower.global_position = get_collision_point()
			new_tower.rotation.y = player.rotation.y
