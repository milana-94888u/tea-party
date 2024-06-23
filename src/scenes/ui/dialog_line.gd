@tool
extends Control


@onready var sprite := %CharacterSprite as TextureRect
@onready var title := %Title as Label
@onready var line_text := %LineText as Label


@export var dialog_line_data: DialogLineData:
	set(value):
		dialog_line_data = value
		if not is_node_ready():
			await ready
		if not is_instance_valid(dialog_line_data) or not is_instance_valid(dialog_line_data.character):
			sprite.texture = null
			title.text = ""
			line_text.text = ""
			return
		sprite.texture = dialog_line_data.character.back_sprite_base
		title.text = dialog_line_data.character.name
		line_text.text = dialog_line_data.text
