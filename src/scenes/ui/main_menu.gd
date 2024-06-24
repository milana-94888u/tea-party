extends Control


@onready var name_line := %NameLine as LineEdit
@onready var pronouns_line := %PronounsLine as LineEdit
@onready var pronouns_options := %PronounsOptions as OptionButton
@onready var tutorial_button := %TutorialButton as Button
@onready var short_game_button := %ShortGameButton as Button
@onready var full_story_button := %FullStoryButton as Button


func _ready() -> void:
	if PlayerData.was_started:
		var pronouns := PlayerData.pronouns_nominative + "/" + PlayerData.pronouns_accusative
		var correct_index := -1
		for index in pronouns_options.item_count:
			if pronouns_options.get_item_text(index) == pronouns:
				correct_index = index
		if correct_index != -1:
			pronouns_options.selected = correct_index
			_on_pronouns_options_item_selected(correct_index)
		else:
			pronouns_options.selected = pronouns_options.item_count - 1
			_on_pronouns_options_item_selected(pronouns_options.item_count - 1)
			_on_pronouns_line_text_changed(pronouns)
			pronouns_line.text = pronouns
		name_line.text = PlayerData.player_name
	else:
		pronouns_options.selected = 2
		_on_pronouns_options_item_selected(2)


func _on_pronouns_options_item_selected(index: int) -> void:
	if index < 4:
		_on_pronouns_line_text_changed(pronouns_options.get_item_text(index))
		pronouns_line.text = pronouns_options.get_item_text(index)
		pronouns_line.editable = false
	else:
		_on_pronouns_line_text_changed("")
		pronouns_line.text = ""
		pronouns_line.editable = true


func validate_alnum(text: String) -> bool:
	var regex := RegEx.create_from_string("[\\w ]+")
	var regex_match := regex.search(text)
	if not is_instance_valid(regex_match):
		return false
	return regex_match.get_string() == text


func validate_pronouns(text: String) -> bool:
	var index := text.find("/")
	if index == -1:
		return false
	var nom_and_accus := text.split("/", true, 2)
	return validate_alnum(nom_and_accus[0]) and validate_alnum(nom_and_accus[1])


func _on_name_line_text_changed(new_text: String) -> void:
	if validate_alnum(new_text):
		tutorial_button.disabled = false
		short_game_button.disabled = false
		full_story_button.disabled = false
	else:
		tutorial_button.disabled = true
		short_game_button.disabled = true
		full_story_button.disabled = true


func _on_pronouns_line_text_changed(new_text: String) -> void:
	if validate_pronouns(new_text):
		tutorial_button.disabled = false
		short_game_button.disabled = false
		full_story_button.disabled = false
	else:
		tutorial_button.disabled = true
		short_game_button.disabled = true
		full_story_button.disabled = true


func _on_tutorial_button_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.button)
	var pronouns := pronouns_line.text.split("/", true, 2)
	PlayerData.start_game(name_line.text, pronouns[0], pronouns[1])
	get_tree().change_scene_to_file("res://src/scenes/learning/empty_main.tscn")


func _on_short_game_button_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.button)
	var pronouns := pronouns_line.text.split("/", true, 2)
	PlayerData.start_game(name_line.text, pronouns[0], pronouns[1])
	get_tree().change_scene_to_file("res://src/scenes/main/main.tscn")


func _on_full_story_button_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.button)
	var pronouns := pronouns_line.text.split("/", true, 2)
	PlayerData.start_game(name_line.text, pronouns[0], pronouns[1], true)
	get_tree().change_scene_to_file("res://src/scenes/main/main.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/ui/credits.tscn")
