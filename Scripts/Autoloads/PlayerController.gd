## Keeps track of various things for the player.
## 
## NOTE: Basically, the player's data.
extends Node

## The player's current team.
var team: Team = null
var current_week: int = 1

func set_team(new_team: Team) -> void:
	team = new_team
