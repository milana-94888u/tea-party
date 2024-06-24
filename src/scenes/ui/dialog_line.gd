@tool
extends Control


signal requested_next_line


@onready var sprite_back := %CharacterSpriteBack as Sprite2D
@onready var sprite_front := %CharacterSpriteFront as Sprite2D
@onready var title := %Title as Label
@onready var line_text := %LineText as Label


@export var dialog_line_data: DialogLineData:
	set(value):
		dialog_line_data = value
		if not is_node_ready():
			await ready
		if not is_instance_valid(dialog_line_data) or not is_instance_valid(dialog_line_data.character):
			sprite_back.texture = null
			sprite_front.texture = null
			title.text = ""
			line_text.text = ""
			return
		sprite_back.texture = dialog_line_data.character.back_sprite_base
		sprite_front.texture = dialog_line_data.character.front_sprite_base
		title.text = dialog_line_data.character.name
		line_text.text = PlayerData.replace_placeholders(dialog_line_data.text)


func _on_click_preventing_background_pressed() -> void:
	requested_next_line.emit()
