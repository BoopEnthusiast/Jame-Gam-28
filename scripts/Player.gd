extends CharacterBody3D

const SPEED = 5.0
const RUN_SPEED = 8.0
const JUMP_VELOCITY = 5.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var animationPlayer: AnimationPlayer = $Camera/HandStab/AnimationPlayer

# Sounds
@onready var walking_sound = $WalkingSound
@onready var jumping_sound = $JumpingSound 
@onready var hit_sound = $HitSound
@onready var death_screen = $UI/DeathScreen

# Is running
var running := false

func _physics_process(delta):
	
	if Singleton.flower_health <= 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		death_screen.visible = true
	
	# Add the gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jumping_sound.play()
		
	
	if Input.is_action_just_pressed("hit"):
		animationPlayer.play("Cube_008Action")
		hit_sound.play()
	
	if not animationPlayer.is_playing():
		animationPlayer.stop()
	
	# Get the input direction and handle the movement/deceleration
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	running = Input.is_action_pressed("sprint")
	
	if direction:
		if is_on_floor():
			walking_sound.volume_db = 0
		else:
			walking_sound.volume_db = -80
		if running:
			velocity.x = direction.x * RUN_SPEED
			velocity.z = direction.z * RUN_SPEED
		else:
			
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
	else:
		walking_sound.volume_db = -80
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	move_and_slide()
