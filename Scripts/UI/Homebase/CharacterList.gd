@tool
## Displays a collection of characters to the player.
class_name CharacterList extends PanelContainer

signal character_selected(displayed_character: CharacterDisplayer, event: InputEvent)

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

@export var _displayed_characters_need_interaction: bool = false

func update_displayed_characters(new_set: Array[CharacterData]) -> void:
	clear()
	for c: CharacterData in new_set:
		var character_displayer: CharacterDisplayer = _character_ui_prefab.instantiate();
		character_displayer.set_character(c)
		characters_to_display.append(c)
		_grid_container.add_child(character_displayer)
		
		if _displayed_characters_need_interaction == true:
			character_displayer.button.gui_input.connect(
				_on_displayed_character_selected.bind(character_displayer)
			)
		
func clear() -> void:
	for c in _grid_container.get_children():
		c.queue_free()
	characters_to_display.clear()

func _on_displayed_character_selected(event: InputEvent, character_displayer: CharacterDisplayer) -> void:
	if event.is_action_pressed("mouse_left"):
		character_selected.emit(character_displayer, event)
		if OS.is_debug_build() == true:
			print("CharacterList :: Player selected a character.")
			
			
