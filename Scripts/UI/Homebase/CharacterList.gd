@tool
## Displays a collection of characters to the player.
class_name CharacterList extends PanelContainer

## Wrapper for the underlying grid container.
@export var columns: int = 1:
	get: return columns
	set(value):
		columns = value
		_grid_container.set_columns(value)

## The template of the UI that gets displayed.
@export var _character_ui_prefab: PackedScene

@export var _grid_container: GridContainer

## The current set of characters this is responsible for showing.
var characters_to_display: Array[CharacterData] = []

# TODO: Functionality for setting up click events

func update_displayed_characters(new_set: Array[CharacterData]) -> void:
	clear()
	for c: CharacterData in new_set:
		var character_displayer: CharacterDisplayer = _character_ui_prefab.instantiate();
		character_displayer.set_character(c)
		_grid_container.add_child(character_displayer)
		
func clear() -> void:
	for c in _grid_container.get_children():
		c.queue_free()
