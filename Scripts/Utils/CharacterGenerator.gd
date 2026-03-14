## Handles creating new characters.
class_name CharacterGenerator extends Node

static func generate_character() -> CharacterData:
	var new_character: CharacterData = CharacterData.new()
	
	var gender = generate_gender()
	new_character.gender = gender
	
	var name = select_name(gender)
	new_character.name = name

	# TODO: Set portrait
	
	var stats = generate_stats()
	new_character.stats = stats
	
	# TODO: Set traits
	if OS.is_debug_build() == true:
		print("CharacterGenerator :: cost for this character: %s" % [get_cost_for_char(new_character)])
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
	
	return gender

static func select_name(gender: String) -> String:
	
	var name: String = ""
	if gender == "Male":
		name = NameDb.get_male_name()
	if gender == "Female":
		name = NameDb.get_female_name()

	name = "%s %s" % [name, NameDb.get_last_name()]
		
	return name

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

	return stats
	
## TODO: Properly implement.
static func get_cost_for_char(character: CharacterData) -> int:
	var sum_of_stats: int = 0
	var stats: Stats = character.stats
	for stat in stats.stats.keys():
		match stat:
			StatHelper.StatTypes.MaxHealth, StatHelper.StatTypes.CurrHealth:
				continue
			# Everything else should have the stat added
			_:
				sum_of_stats += stats.stats[stat].get_calculated_value()
	return sum_of_stats
