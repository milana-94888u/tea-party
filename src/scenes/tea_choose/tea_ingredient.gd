@tool
class_name TeaIngredientButton
extends TextureButton


var original_spot: Control


@export var ingredient_data: TeaIngredient:
	set(value):
		ingredient_data = value
		if not is_node_ready():
			await ready
		texture_normal = ingredient_data.ingredient_sprite
		texture_pressed = ingredient_data.ingredient_sprite
		texture_hover = ingredient_data.ingredient_sprite
		texture_focused = ingredient_data.ingredient_sprite
		texture_disabled = ingredient_data.ingredient_sprite
		texture_click_mask = ingredient_data.click_mask
