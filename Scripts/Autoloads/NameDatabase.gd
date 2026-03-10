extends Node

const MALE: String = "MALE"
const FEMALE: String = "FEMALE"
const LAST: String = "LAST NAME"

var char_names: Dictionary = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	load_character_names()

## Loads the character names and stores them.
func load_character_names() -> void:
	char_names[MALE]   = []
	char_names[FEMALE] = []
	char_names[LAST]   = []
	
	var char_names_path: String = "res://Imported Assets/Randomized names - Sheet1.csv"
	var file = FileAccess.open(char_names_path, FileAccess.READ)
	while file.eof_reached() == false:
		var csv = file.get_csv_line()
		
		if csv[0] != MALE and csv[0] != "":
			char_names[MALE].append(csv[0])
		
		if csv.size() > 1:
			if csv[1] != FEMALE and csv[1] != "":
				char_names[FEMALE].append(csv[1])
		
		if csv.size() > 2:
			if csv[2] != LAST and csv[2] != "":
				char_names[LAST].append(csv[2])
	
	file.close()
	

func get_male_name() -> String:
	var potential_names: PackedStringArray = char_names[MALE]
	potential_names.append_array(char_names[LAST])
	var index: int = randi_range(0, potential_names.size() - 1)
	var chosen_name: String = potential_names[index]
	return chosen_name

func get_female_name() -> String:
	var potential_names: PackedStringArray = char_names[FEMALE]
	potential_names.append_array(char_names[LAST])
	var index: int = randi_range(0, potential_names.size() - 1)
	var chosen_name: String = potential_names[index]
	return chosen_name
	
func get_last_name() -> String:
	var potential_names: PackedStringArray = char_names[LAST]
	potential_names.append_array(char_names[LAST])
	var index: int = randi_range(0, potential_names.size() - 1)
	var chosen_name: String = potential_names[index]
	return chosen_name

#func is_male_portrait(portrait_data: PortraitData) -> bool:
#	for c in character_class_db:
#		if c.male_portraits.has(portrait_data) == true:
#			return true
#	return false

#func is_female_portrait(portrait_data: PortraitData) -> bool:
#	for c in character_class_db:
#		if c.female_portraits.has(portrait_data) == true:
#			return true
#	return false
