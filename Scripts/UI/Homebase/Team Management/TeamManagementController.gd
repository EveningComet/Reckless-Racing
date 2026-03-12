## The middleman between the data and the UI.
class_name TeamManagementController extends Node

@export_category("Buttons")
@export var _manage_button:  Button
@export var _role_placement_button: Button
@export var _training_button: Button

@export_category("Menus")
@export var _manage_team_menu: ManageTeamMenu

func _ready() -> void:
	_manage_team_menu.hide()
	_manage_button.pressed.connect( _on_manage_button_pressed )
	_role_placement_button.pressed.connect( _on_role_placement_pressed )
	_training_button.pressed.connect( _on_training_button_pressed )
	
	get_parent().visibility_changed.connect( _on_visibility_changed )
	
	_update_pool()

func _on_manage_button_pressed() -> void:
	_manage_team_menu.show()

func _on_role_placement_pressed() -> void:
	_manage_team_menu.hide()

func _on_training_button_pressed() -> void:
	_manage_team_menu.hide()

func _on_visibility_changed() -> void:
	_manage_team_menu.hide()

## Update the available people for hire.
func _update_pool() -> void:
	var num_people_to_spawn: int = 10
	for i in num_people_to_spawn:
		var new_person = CharacterGenerator.generate_character()
		HirePool.add_to_pool(new_person)
