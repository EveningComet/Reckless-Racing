## Handles creating new characters.
class_name CharacterGenerator extends Node

static func generate_character() -> CharacterData:
	var new_character: CharacterData = CharacterData.new()
	
	var gender = generate_gender()
	new_character.gender = gender
	
	# TODO: Set name
	# TODO: Set portrait
	
	var stats = generate_stats()
	new_character.stats = stats
	
	# TODO: Set traits
	
	return new_character

## Setup the gender for a character
static func generate_gender() -> String:
	
	var gender_gen = randi() % 2 + 1
	var gender: String = ""
	match gender_gen:
		1:
			gender = "Male"
		2:
			gender = "Female"
	
	# LOGGER
	if OS.is_debug_build() == true:
		print("CharacterGenerator :: Gender: %s" %gender)
	
	return gender


## Setup the stats for a character.
static func generate_stats() -> Stats:
	var stat_dict: Dictionary[StatHelper.StatTypes, Stat] = {}
	var base_stat: int = 50 # Change with set difficulties?

	# Init values with normal distribution system
	# TODO: Vary base stats somehow? (Not sure if we even need it)
	var hp_val: int = 100
	var race_skill: int = NormalDist.stat_normal_gen(base_stat)
	var charisma: int = NormalDist.stat_normal_gen(base_stat)
	var tech: int = NormalDist.stat_normal_gen(base_stat)
	var management: int = NormalDist.stat_normal_gen(base_stat)
	
	# Set stat values to generated values
	stat_dict[StatHelper.StatTypes.MaxHealth] = Stat.new(hp_val)
	stat_dict[StatHelper.StatTypes.CurrHealth] = Stat.new(hp_val)
	stat_dict[StatHelper.StatTypes.RaceSkill] = Stat.new(race_skill)
	stat_dict[StatHelper.StatTypes.Charisma] = Stat.new(charisma)
	stat_dict[StatHelper.StatTypes.Tech] = Stat.new(tech)
	stat_dict[StatHelper.StatTypes.Management] = Stat.new(management)
	
	var stats = Stats.new()
	stats.stats = stat_dict
	
	# LOGGING
	if OS.is_debug_build() == true:
		for stat in stat_dict.keys():
			print("CharacterGenerator :: Stats: %s value was: %s" % [stat, stat_dict[stat].get_calculated_value()])
	print("\n")

	return stats
