## Represents a sub-menu in the Schedule Event menu.
class_name ScheduableEventUI extends Control

## The associated button this menu uses to open.
@export var _menu_button: Button

## The button that will be used for the drop down.
@export var _character_select_drop_down_button: OptionButton

func _ready() -> void:
	_menu_button.pressed.connect( _on_button_pressed )
	PlayerController.team.roster_updated.connect( _on_roster_updated )
	_on_roster_updated( PlayerController.team.roster )

func _schedule_event(character_using: CharacterData, scheduled_event_target) -> void:
	var scheduled_event_data: ScheduableEventData = ScheduableEventData.new(
		character_using, scheduled_event_target
	)

func _on_button_pressed() -> void:
	show()

#TODO: Make sure this only updates when the player opens the menu to save resources.
func _on_roster_updated(roster: Array[CharacterData]) -> void:
	clear_selectable_choices()
	for cd: CharacterData in roster:
		_character_select_drop_down_button.add_item(cd.name)

func clear_selectable_choices() -> void:
	_character_select_drop_down_button.clear()
