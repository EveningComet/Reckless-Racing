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
