extends Control


@onready var book_display := $BookDisplay as TextureButton


@export var yellow_page_texture: Texture2D
@export var blue_page_texture: Texture2D
@export var pink_page_texture: Texture2D


func _on_yellow_mark_pressed() -> void:
	book_display.texture_normal = yellow_page_texture


func _on_blue_mark_pressed() -> void:
	book_display.texture_normal = blue_page_texture


func _on_pink_mark_pressed() -> void:
	book_display.texture_normal = pink_page_texture


func _on_outside_space_pressed() -> void:
	hide()
