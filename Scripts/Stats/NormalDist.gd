class_name NormalDist
extends Node

static func seed_gen():
	var rng = RandomNumberGenerator.new()
	rng.seed = 420

static func stat_normal_gen(base_stat: int) -> int:

	var mean = 0
	var variance = 1
	
	var normal_dist = abs(randfn(mean, variance))
	var new_stat = ceili(base_stat * normal_dist)
	
	print(new_stat)
	return new_stat
	
