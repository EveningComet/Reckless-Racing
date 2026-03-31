## A container for [CharacterData] stats.
class_name Stats extends Resource

signal stat_changed(stats: Stats)

## Key value pair of the stats being stored.
@export var stats: Dictionary[StatHelper.StatTypes, Stat] = {}

var curr_hp: int:
	get: return int(floor(stats[StatHelper.StatTypes.CurrHealth].get_base_value()))
	set(value):
		var temp = value
		if temp > max_hp:
			temp = max_hp
		stats[StatHelper.StatTypes.CurrHealth].set_base_value(temp)
		stat_changed.emit( self )

var max_hp: int:
	get: return floor(int(stats[StatHelper.StatTypes.MaxHealth].get_calculated_value()))

func add_modifier(stat_type: StatHelper.StatTypes, mod: StatModifier) -> void:
	stats[stat_type].add_modifier(mod)
	stat_changed.emit(self)

func remove_modifier(stat_type: StatHelper.StatTypes, mod: StatModifier) -> void:
	stats[stat_type].remove_modifier(mod)
	stat_changed.emit(self)
