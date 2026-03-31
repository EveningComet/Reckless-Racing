## Stores data for something the player scheduled.
class_name ScheduableEventData extends Resource

## The character the player selected to do the thing.
var character_doing: CharacterData

## The thing that will be targeted. Not all scheduable events will need this.
var scheduable_event_target

func _init(char_doing: CharacterData = null, scheduable_target = null) -> void:
	character_doing = char_doing
	scheduable_event_target = scheduable_target
