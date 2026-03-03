## Handles creating new characters.
class_name CharacterGenerator extends Node

static func generate_character() -> CharacterData:
	var new_character: CharacterData = CharacterData.new()
	# TODO: Set male or female
	# TODO: Set name
	# TODO: Set portrait
	
	var stats = generate_stats()
	new_character.stats = stats
	
	# TODO: Set traits?
	return new_character

## Setup the stats for a character.
static func generate_stats() -> Stats:
	var stat_dict: Dictionary[StatHelper.StatTypes, Stat] = {}
	var prng = RandomNumberGenerator.new()
	prng.randomize()
	var hp_val: int = 100
	var race_skill: int = prng.randi() % 101 + 1
	var charisma: int = prng.randi() % 101 + 1
	var tech: int = prng.randi() % 101 + 1
	stat_dict[StatHelper.StatTypes.MaxHealth] = Stat.new(hp_val)
	stat_dict[StatHelper.StatTypes.CurrHealth] = Stat.new(hp_val)
	stat_dict[StatHelper.StatTypes.RaceSkill] = Stat.new(race_skill)
	stat_dict[StatHelper.StatTypes.Charisma] = Stat.new(charisma)
	stat_dict[StatHelper.StatTypes.Tech] = Stat.new(tech)
	var stats = Stats.new()
	stats.stats = stat_dict
	if OS.is_debug_build() == true:
		for stat in stat_dict.keys():
			print("CharacterGenerator :: Stats: %s value was: %s" % [stat, stat_dict[stat].get_calculated_value()])
	return stats
