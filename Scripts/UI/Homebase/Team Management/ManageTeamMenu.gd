## The middleman between the player's roster and the hiring pool.
class_name ManageTeamMenu extends CanvasLayer

@export var roster_list: CharacterList
@export var hire_list: CharacterList

## Used for drag and dropping.
@export var _grabbed_ui: CharacterDisplayer
var _grabbed_character_data: CharacterData = null

@onready var _control_node: Control = get_child(0)

func _ready() -> void:
	hire_list.clear()
	roster_list.clear()
	
	# Setup the events
	PlayerController.team.roster_updated.connect( _on_player_roster_list_updated )
	hire_list.character_selected.connect( _on_list_content_interacted )
	roster_list.character_selected.connect( _on_list_content_interacted )
	hire_list.gui_input.connect( _on_manage_window_selected.bind(hire_list) )
	roster_list.gui_input.connect( _on_manage_window_selected.bind(roster_list) )
	HirePool.hire_pool_updated.connect( _on_hire_pool_updated )
	_on_player_roster_list_updated(PlayerController.team.roster)

func _input(event: InputEvent) -> void:
	if _grabbed_ui.visible == true:
		_grabbed_ui.global_position = _control_node.get_global_mouse_position() + Vector2(5, 5)

func _on_hire_pool_updated(people_to_show: Array[CharacterData]) -> void:
	hire_list.update_displayed_characters(people_to_show)

func _on_player_roster_list_updated(roster: Array[CharacterData]) -> void:
	roster_list.update_displayed_characters(roster)

## Called when a character in the roster or the hiring pool has been selected.
func _on_list_content_interacted(
	interacted_displayer: CharacterDisplayer,
	event: InputEvent
) -> void:
	
	if event.is_action_pressed("mouse_left"):
		
		match [_grabbed_character_data, interacted_displayer]:
		
			# The player is selecting a character
			[null, interacted_displayer]:
				_grabbed_character_data = interacted_displayer.character
			
			# Something not accounted for happened
			[_, _]:
				pass
	
	# We have the character, do some clean up and update the drag and drop
	var object_to_check = _get_object_containing_character(_grabbed_character_data)
	if object_to_check != null:
		if object_to_check is PlayerController:
			PlayerController.team.remove_from_roster(_grabbed_character_data)
		elif object_to_check is HirePool:
			HirePool.remove_from_pool(_grabbed_character_data)
	_update_grabbed_ui()

func _on_manage_window_selected(event: InputEvent, list_to_check: CharacterList) -> void:
	if event.is_action_pressed("mouse_left") and _grabbed_character_data != null:
		if list_to_check == roster_list:
			PlayerController.team.add_to_roster(_grabbed_character_data)
		elif list_to_check == hire_list:
			HirePool.add_to_pool(_grabbed_character_data)
		_grabbed_character_data = null
		_update_grabbed_ui()
	
func _update_grabbed_ui() -> void:
	if _grabbed_character_data != null:
		_grabbed_ui.set_character(_grabbed_character_data)
		_grabbed_ui.global_position = _control_node.get_global_mouse_position()
		_grabbed_ui.show()
	else:
		_grabbed_ui.hide()

func _get_object_containing_character(char_to_check: CharacterData) -> Variant:
	if PlayerController.team.roster.has(char_to_check) == true:
		return PlayerController
	elif HirePool.hire_pool.has(char_to_check) == true:
		return HirePool
	return null
