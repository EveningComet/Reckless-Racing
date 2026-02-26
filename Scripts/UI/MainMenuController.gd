## Manages the main menu.
class_name MainMenuController extends Node

@export var start_game_button: Button
@export var quit_button:       Button

@export var button_holder: Container

## Reference to the scene storing the homebase.
@export_file("*.tscn") var _game_scene: String

# Called when the node enters the scene tree for the first time.
func _ready():
	start_game_button.pressed.connect(_on_start_game_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	
	# Allow gamepad controls
	button_holder.get_child(0).grab_focus()

func _on_start_game_pressed() -> void:
	# TODO: Setting up the team here is for testing.
	# Delete when no longer needed.
	var team = Team.new()
	team.name = "Test Team"
	team.money = 500
	PlayerController.set_team(team)
	
	SceneManager.change_scene(_game_scene)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
