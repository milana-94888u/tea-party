extends Control


@onready var learning_label := %LearningLabel as Label
@onready var next_button := %NextButton as Button
@onready var finishing := %Finishing as VBoxContainer
@onready var invitation := %Invitation as VBoxContainer

@onready var teapot := %Teapot as TextureRect


@export var info: Array[String]
var current_info := 0


func _ready() -> void:
	current_info = 0
	learning_label.text = info[0]
	finishing.hide()


func choose_tea() -> Tea:
	var shelves := preload("res://src/scenes/tea_choose/shelves.tscn").instantiate()
	hide()
	add_sibling.call_deferred(shelves)
	shelves.show()
	var tea: Tea = await shelves.tea_completed
	shelves.queue_free()
	show()
	return tea


func make_tea() -> void:
	SfxPlayer.play_sound_effect(Sounds.button)
	invitation.hide()
	var tea := await choose_tea()
	teapot.texture = tea.base.teapot
	await SfxPlayer.play_sound_effect(Sounds.tea_pour)
	await get_tree().create_timer(1.0).timeout
	finishing.show()


func _on_next_button_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.button)
	current_info += 1
	learning_label.text = info[current_info]
	if current_info >= len(info) - 1:
		next_button.text = "To making tea"
		next_button.pressed.disconnect(_on_next_button_pressed)
		next_button.pressed.connect(make_tea)


func _on_finish_button_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.button)
	get_tree().change_scene_to_file("res://src/scenes/ui/main_menu.tscn")
