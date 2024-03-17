extends CharacterBody3D
class_name enemy

var health: float
var gravity = 0
@onready var flower_pos: Vector3 = get_parent().get_node("Flower").position
@export var MAX_HEALTH: float
@export var START_HEALTH: float
@export var MOVE_SPEED: float
@export var JUMP_VELOCITY: float
@export var WATER_VALUE: int
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D
@onready var collider: CollisionShape3D = $Collider
@onready var death_sound: AudioStreamPlayer3D = $DeathSound

func _ready():
	# Set health
	health = START_HEALTH

func _process(_delta):
	if health > MAX_HEALTH:
		health = MAX_HEALTH
	run_animations()

func _physics_process(delta):
	# This won't work if there is no nav mesh
	
	# Gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Move towards the flower
	move_to(flower_pos)
	
	# Damage the flower if colliding
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		print(collision)
		if collision.get_collider().name == "Flower":
			collision.get_collider().call("damage", 10.0)
			death_sound.play()
			get_parent().remove_child(self)
			return
	move_and_slide()

func move_to(pos: Vector3):
	# Set navigation agent target position
	navigation_agent.set_target_position(pos)
	
	if navigation_agent.is_navigation_finished():
		return
	
	# Get current position and find next path position
	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()
	
	# Look in the direction
	look_at(next_path_position)
	
	# Move towards next path position
	velocity = current_agent_position.direction_to(next_path_position) * MOVE_SPEED

func run_animations():
	pass

func get_health() -> float:
	return health

func heal(hp: float):
	if health + hp > MAX_HEALTH:
		health = MAX_HEALTH
	health += hp

func damage(dp: float, upgrade_level: int):
	health -= dp*(upgrade_level/1.75)
	if health <= 0:
		Singleton.water += WATER_VALUE * upgrade_level
		get_parent().remove_child(self)

func set_move_speed(speed: float):
	MOVE_SPEED = speed

func get_move_speed() -> float:
	return MOVE_SPEED

func get_global_position_from_enemy():
	return global_position
