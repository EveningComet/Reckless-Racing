## Stores information related to ingame teams.
class_name Team extends Resource

signal roster_updated(new_roster: Array[CharacterData])

@export var name: String = "New Team"
@export var roster: Array[CharacterData] = []
@export var money: int = 0

func add_to_roster(new_person: CharacterData) -> void:
	roster.append(new_person)
	roster_updated.emit(roster)

func remove_from_roster(person_to_remove: CharacterData) -> void:
	if roster.has(person_to_remove) == true:
		roster.erase(person_to_remove)
	roster_updated.emit(roster)
