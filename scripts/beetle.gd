extends "res://scripts/baseEnemy.gd"

var beetleAnimations = ["Cube_001Action", "Cube_002Action", "Cube_003Action", "Cube_004Action", "Cube_005Action", "Cube_006Action", "Cube_007Action"]
@onready var animation_players: Array[AnimationPlayer] = [$BeetleTextured/AnimationPlayer, $BeetleTextured/AnimationPlayer2, $BeetleTextured/AnimationPlayer3, $BeetleTextured/AnimationPlayer4, $BeetleTextured/AnimationPlayer5, $BeetleTextured/AnimationPlayer6, $BeetleTextured/AnimationPlayer7]

func run_animations():
	for i in range(6, -1, -1):
		animation_players[i].play(beetleAnimations[i])
		print(animation_players[i],"  ",beetleAnimations[i])
