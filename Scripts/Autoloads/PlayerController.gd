## Keeps track of various things for the player.
## 
## NOTE: Basically, the player's data.
extends Node

## The player's current team.
var team: Team = null
var current_week: int = 1

## The list of things that will be processed at the start of the week.
var player_scheduled_events: Array[ScheduableEventData]

func set_team(new_team: Team) -> void:
	team = new_team

## Safety check to make sure the player has all the needed team slots filled out.
## TODO: Implement properly.
func is_player_team_valid() -> bool:
	if team.roster.size() == 0:
		return false
	return true
