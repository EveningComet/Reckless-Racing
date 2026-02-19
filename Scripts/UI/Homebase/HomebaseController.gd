class_name HomebaseController extends Node

@export var _end_week_button: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_end_week_button.pressed.connect( _on_end_week_button_pressed )

## Perform the end of week cleanup.
func _on_end_week_button_pressed() -> void:
	SceneManager.reload_scene()
