extends CharacterBody3D

var health: float
var flower_pos: Vector3
@export var MAX_HEALTH: float
@export var MOVE_SPEED: float
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

func _ready():
	self.health = self.MAX_HEALTH
	self.flower_pos = get_tree().root.get_node("/root/Flower").position

func _process(delta):
	if health <= 0:
		get_parent().remove_child(self)

func _physics_process(delta):
	_move_to(self.flower_pos)

func _move_to(pos: Vector3):
	self.navigation_agent.set_target_position(pos)
	if self.navigation_agent.is_navigation_finished():
		return
	
	var current_agent_position: Vector3 = self.global_position
	var next_path_position: Vector3 = self.navigation_agent.get_next_path_position()

	self.velocity = current_agent_position.direction_to(next_path_position) * MOVE_SPEED
	self.move_and_slide()

#Call these with obj.call_deferred("func_name", args)
func _get_health() -> float:
	return self.health

func _damage(dp: float):
	self.health -= dp

func _set_move_speed(speed: float):
	self.MOVE_SPEED = speed

func _get_move_speed() -> float:
	return self.MOVE_SPEED
