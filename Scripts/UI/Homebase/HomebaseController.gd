## The middleman for managing the different menus in the homebase.
class_name HomebaseController extends Node

@export_category("Buttons")
@export var _manage_team_button: Button
@export var _season_management_button: Button

@export_category("Menus")
@export var _team_management_menu: CanvasLayer
@export var _season_management_menu: CanvasLayer

@export_category("Extras")
@export var _player_money_displayer: MoneyDisplayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_manage_team_button.pressed.connect(_on_manage_team_button_pressed )
	_season_management_button.pressed.connect( _on_season_management_button_pressed )
	Eventbus.end_week_called.connect(_on_end_week_cleanup)
	
	# Setup displaying the player's money
	_player_money_displayer.update_displayed_amount(PlayerController.team.money)
	PlayerController.team.money_changed.connect(_on_money_changed)

func _on_manage_team_button_pressed() -> void:
	_season_management_menu.hide()
	_team_management_menu.show()

func _on_season_management_button_pressed() -> void:
	_team_management_menu.hide()
	_season_management_menu.show()

## Used to automatically display .
func _on_money_changed(new_amount: int) -> void:
	_player_money_displayer.update_displayed_amount(new_amount)

## Clean up some things when the end of the week has been called.
func _on_end_week_cleanup() -> void:
	_season_management_button.disabled = true
	_manage_team_button.disabled = true
