extends RayCast3D

# Get nodes
var ground_node: StaticBody3D
@onready var player := $".."
@onready var tower_limiter := $"../../TowerLimiter"
@onready var tower_menu := $"../../UI/TowerSpawnMenu"

# Preload scenes to spawn
var test_tower = preload("res://scenes/tower_base.tscn")

#variables
var spawn_location: Vector3


# Get the ground node
func _ready() -> void:
	ground_node = get_tree().get_first_node_in_group("ground")


# Interact with objects
func _physics_process(_delta) -> void:
	if Input.is_action_just_pressed("interact") and is_colliding():
		var interacted_object: Object = get_collider()
		if interacted_object == ground_node:
			tower_limiter.global_position = get_collision_point()
			var nearby_bodies: Array = tower_limiter.get_overlapping_bodies()
			for body in nearby_bodies:
				if body is Tower:
					return
			spawn_location = get_collision_point()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			tower_menu.visible = true
		elif interacted_object is Flower and Singleton.water >= 10:
			Singleton.water -= 10
			interacted_object.grow(2)
			Singleton.score += 1
