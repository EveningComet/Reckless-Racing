class_name EndWeekHandler extends Node

@export var _end_week_button: Button

func _ready() -> void:
	_end_week_button.pressed.connect( _on_end_week_button_pressed )

## Perform the end of week cleanup.
func _on_end_week_button_pressed() -> void:
	# TODO: Handle this better
	# Make sure the player 
	if (PlayerController.current_week + 1) % 4 == 0:
		if PlayerController.is_player_team_valid() == false:
			return
			
	PlayerController.current_week += 1
	_end_week_button.disabled = true
	Eventbus.end_week_called.emit()
	
	# TODO: Handle this better.
	if PlayerController.current_week % 4 == 0:
		SceneManager.change_scene("res://Scenes/Race.tscn")
	else:
		SceneManager.reload_scene()
