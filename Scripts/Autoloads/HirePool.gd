extends Node

signal hire_pool_updated(new_pool: Array[CharacterData])

var hire_pool: Array[CharacterData] = []

func add_to_pool(new_person: CharacterData) -> void:
	hire_pool.append(new_person)
	hire_pool_updated.emit(hire_pool)

func remove_from_pool(person_to_remove: CharacterData) -> void:
	if hire_pool.has(person_to_remove) == true:
		hire_pool.erase(person_to_remove)
	hire_pool_updated.emit(hire_pool)
