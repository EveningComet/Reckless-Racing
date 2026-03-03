## Holds information for the character.
class_name CharacterData extends Resource

@export var name: String = "New Name"

## The wrapper containing the character's stats.
var stats: Stats

func _init(stats_to_set: Stats = null) -> void:
	stats = stats_to_set
