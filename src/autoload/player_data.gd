extends Node


@export var player_name: String
@export var pronouns_nominative: String
@export var pronouns_accusative: String
@export var was_started := false
@export var is_full := false


func start_game(
	player_name_: String,
	pronouns_nominative_: String,
	pronouns_accusative_: String,
	is_full_ := false,
) -> void:
	was_started = true
	player_name = player_name_
	pronouns_nominative = pronouns_nominative_
	pronouns_accusative = pronouns_accusative_
	is_full = is_full_


func replace_placeholders(text: String) -> String:
	return text.replace(
		"*name*", player_name
	).replace(
		"*pron_nom*", pronouns_nominative.capitalize()
	).replace(
		"*pron_accus*", pronouns_accusative.capitalize()
	).replace(
		"*pron_be*", (
			pronouns_nominative + (
				"'s" if pronouns_nominative != "they" else "'re"
			)
		).capitalize()
	)
