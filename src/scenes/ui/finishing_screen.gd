extends Control


@onready var finish_label := %FinishLabel as Label


@export var short_text: String
@export var full_text: String


func _ready() -> void:
	finish_label.text = full_text if PlayerData.is_full else short_text


func _on_to_main_menu_button_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.button)
	get_tree().change_scene_to_file("res://src/scenes/ui/main_menu.tscn")
