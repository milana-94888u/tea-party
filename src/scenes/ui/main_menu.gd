extends Control


@onready var name_line := %NameLine as LineEdit
@onready var pronouns_line := %PronounsLine as LineEdit
@onready var pronouns_options := %PronounsOptions as OptionButton


func _on_pronouns_options_item_selected(index: int) -> void:
	if index < 3:
		pronouns_line.text = pronouns_options.get_item_text(index)
		pronouns_line.editable = false
	else:
		pronouns_line.text = ""
		pronouns_line.editable = true


func _on_start_button_pressed() -> void:
	var pronouns := pronouns_line.text.split("/")
	PlayerData.start_game(name_line.text, pronouns[0], pronouns[1])
	get_tree().change_scene_to_file("res://src/scenes/main/main.tscn")
