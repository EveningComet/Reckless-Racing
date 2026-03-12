## Stores information related to ingame teams.
class_name Team extends Resource

signal roster_updated(new_roster: Array[CharacterData])

signal money_changed(new_money: int)

@export var name: String = "New Team"
@export var roster: Array[CharacterData] = []
@export var money: int = 0

## Add the character to the roster, and notify anything that cares about the change.
func add_to_roster(new_person: CharacterData) -> void:
	roster.append(new_person)
	roster_updated.emit(roster)

## Remove the character from the roster, and notify anything that cares about the change.
func remove_from_roster(person_to_remove: CharacterData) -> void:
	if roster.has(person_to_remove) == true:
		roster.erase(person_to_remove)
	roster_updated.emit(roster)

## Taking the value, add or subtract that value from how much money the team has.
func add_or_sub_money(amount_to_sub_or_add: int) -> void:
	money += amount_to_sub_or_add
	money_changed.emit(money)
