@tool
extends HBoxContainer


@onready var sprite := %IngredientSprite as TextureRect
@onready var title := %IngredientTitle as Label
@onready var description := %IngredientDescription as Label


@export var ingredient_data: TeaIngredient:
	set(value):
		ingredient_data = value
		if not is_node_ready():
			await ready
		if not is_instance_valid(ingredient_data):
			sprite.texture = null
			title.text = ""
			description.text = ""
			return
		sprite.texture = ingredient_data.ingredient_sprite
		title.text = ingredient_data.name
		description.text = ingredient_data.description
