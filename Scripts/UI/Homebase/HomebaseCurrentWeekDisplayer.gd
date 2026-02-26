## Simply displays what week the player is currently on.
class_name HomebaseCurrentWeekDisplayer extends PanelContainer

@export var _number_label: Label

func _ready() -> void:
	_number_label.set_text(str(PlayerController.current_week))
