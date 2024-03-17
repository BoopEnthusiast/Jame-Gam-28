extends "res://scripts/baseEnemy.gd"

var beetleAnimations = ["Cube_002Action", "Cube_003Action", "Cube_004Action", "Cube_005Action", "Cube_006Action", "Cube_007Action"]

func run_animations():
	var animation: String = beetleAnimations[randi_range(0 , beetleAnimations.size() - 1)]
	
	if not $BeetleTextured/AnimationPlayer.is_playing():
		$BeetleTextured/AnimationPlayer.play(animation)
