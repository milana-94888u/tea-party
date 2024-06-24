extends Node


@export var player_name: String
@export var pronouns_nominative: String
@export var pronouns_accusative: String


func start_game(
	player_name_: String,
	pronouns_nominative_: String,
	pronouns_accusative_: String
) -> void:
	player_name = player_name_
	pronouns_nominative = pronouns_nominative_
	pronouns_accusative = pronouns_accusative_


func replace_placeholders(text: String) -> String:
	return text.replace(
		"*name*", player_name
	).replace(
		"*pron_nom*", pronouns_nominative
	).replace(
		"*pron_accus*", pronouns_accusative
	)
