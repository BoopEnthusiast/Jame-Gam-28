extends CharacterBody3D

var health: float
@export var MAX_HEALTH: float
@export var MOVE_SPEED: float
@onready var navigation_agent: NavigationAgent3D = $NavigationAgent3D

func _ready():
	self.health = self.MAX_HEALTH

func _process(delta):
	if health <= 0:
		get_parent().remove_child(self)

func _move_to(pos: Vector3):
	pass

func _get_health() -> float:
	return self.health

func _damage(dp: float):
	self.health -= dp

func _set_move_speed(speed: float):
	self.MOVE_SPEED = speed

func _get_move_speed() -> float:
	return self.MOVE_SPEED
