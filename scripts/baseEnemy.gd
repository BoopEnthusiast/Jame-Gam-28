extends CharacterBody3D

var health: float
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var flower_pos: Vector3 = get_parent().get_node("Flower").position
@export var MAX_HEALTH: float
@export var START_HEALTH: float
@export var MOVE_SPEED: float
@export var JUMP_VELOCITY: float
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

func _ready():
	# Set health
	health = START_HEALTH

func _process(_delta):
	# Check health and die if 0 and lower
	if health <= 0:
		get_parent().remove_child(self)
	if health > MAX_HEALTH:
		health = MAX_HEALTH

func _physics_process(delta):
	# This won't work if there is no nav mesh
	
	# Gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Move towards the flower
	_move_to(flower_pos)
	move_and_slide()

func _move_to(pos: Vector3):
	# Set navigation agent target position
	navigation_agent.set_target_position(pos)
	
	# Check for if nav finished
	if navigation_agent.is_navigation_finished():
		return

	# Jump
	if is_on_wall() and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().name == "Flower":
			collision.get_collider().call("_damage", 10.0)
	
	# Get current position and find next path position
	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()
	
	# Move towards next path position
	velocity = current_agent_position.direction_to(next_path_position) * MOVE_SPEED

#Call these with obj.call_deferred("func_name", args)
func _get_health() -> float:
	return health

func _heal(hp: float):
	if health + hp > MAX_HEALTH:
		health = MAX_HEALTH
	health += hp

func _damage(dp: float):
	health -= dp

func _set_move_speed(speed: float):
	MOVE_SPEED = speed

func _get_move_speed() -> float:
	return MOVE_SPEED
