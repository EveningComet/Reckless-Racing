## Represents a sub-menu in the Schedule Event menu.
class_name ScheduableEventUI extends Node

## The associated button this menu uses to open.
@export var _button: Button

## The associated menu.
@export var _associated_menu: CanvasLayer

func _ready() -> void:
	_button.pressed.connect( _on_button_pressed )

func _schedule_event(character_using: CharacterData, scheduled_event_target) -> void:
	var scheduled_event_data: ScheduableEventData = ScheduableEventData.new(
		character_using, scheduled_event_target
	)

func _on_button_pressed() -> void:
	_associated_menu.show()
