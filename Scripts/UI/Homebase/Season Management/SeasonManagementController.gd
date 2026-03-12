## Handles various things for the menus in the season management screen.
class_name SeasonManagementController extends Node

@export_category("Buttons")

## Used to activate the menus related to scheduling things.
@export var _schedule_button: Button

@export_category("Menus")
@export var _schedule_event_menu: CanvasLayer

func _ready() -> void:
	_schedule_event_menu.hide()
	_schedule_button.pressed.connect(_on_schedule_button_pressed)
	get_parent().visibility_changed.connect( _on_visibility_changed )

func _on_schedule_button_pressed() -> void:
	_schedule_event_menu.show()

func _on_visibility_changed() -> void:
	_schedule_event_menu.hide()
