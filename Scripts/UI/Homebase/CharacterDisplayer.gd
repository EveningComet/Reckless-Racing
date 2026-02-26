## A reusable UI component that handles displaying a character.
class_name CharacterDisplayer extends PanelContainer
# TODO: Might need to create a better name for this.

## Displayer of the character's visuals.
@export var portrait: TextureRect

## Displays the character's name.
@export var _name_label: Label

## The attached button used for click events.
@export var button: Button

## The attached character.
var character: CharacterData

## Modify the stored character.
func set_character(new_c: CharacterData) -> void:
	character = new_c
	_name_label.set_text(character.name)
