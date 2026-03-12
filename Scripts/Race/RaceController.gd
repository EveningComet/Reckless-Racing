## Handles the race scene.
class_name RaceController extends Node

## Node that will display the racers of the participating teams.
@export var _racer_display_list: CharacterList

@export var _end_race_button: Button
@export_file("*.tscn") var _homebase_scene: String

func _ready() -> void:
	_end_race_button.pressed.connect(_on_end_race_button_pressed)
	
	if OS.is_debug_build() == true:
		print("RaceController :: Num team members: %s." % [PlayerController.team.roster.size()])

func _on_end_race_button_pressed() -> void:
	_end_race_button.disabled = true
	
	# TODO: Scale the money, somehow, someway.
	var prize_money: int = 100
	PlayerController.team.add_or_sub_money(prize_money)
	SceneManager.change_scene(_homebase_scene)
