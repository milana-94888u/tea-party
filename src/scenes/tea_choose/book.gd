extends Control


@onready var book_display := $BookDisplay as TextureButton
@onready var ingredients_grid := $GridContainer as GridContainer


@export var yellow_page_texture: Texture2D
@export var blue_page_texture: Texture2D
@export var pink_page_texture: Texture2D

@export var base_ingredients: Array[TeaIngredient]
@export var flower_ingredients: Array[TeaIngredient]
@export var fruit_bits_ingredients: Array[TeaIngredient]


func set_ingredients(ingredients: Array[TeaIngredient]) -> void:
	for index in len(ingredients):
		ingredients_grid.get_child(index).ingredient_data = ingredients[index]


func _on_yellow_mark_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.page_flip)
	book_display.texture_normal = yellow_page_texture
	set_ingredients(base_ingredients)


func _on_blue_mark_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.page_flip)
	book_display.texture_normal = blue_page_texture
	set_ingredients(flower_ingredients)


func _on_pink_mark_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.page_flip)
	book_display.texture_normal = pink_page_texture
	set_ingredients(fruit_bits_ingredients)


func _on_outside_space_pressed() -> void:
	SfxPlayer.play_sound_effect(Sounds.book_close)
	hide()
