class_name TeaIngredient
extends Resource


enum TeaEffect {
	CALMING,
	ENERGIZING,
	PLAIN,
	INSPIRING,
	BITTER,
	SWEET,
}

enum IngredientType {
	BASE,
	FLOWERS,
	FRUIT_BITS,
}

@export var name: String
@export var description: String
@export var effect: TeaEffect
@export var ingredient_type: IngredientType


@export var ingredient_sprite: Texture2D
@export var click_mask: BitMap

@export var teapot: Texture2D  # only for base
@export var tea_in_cup: Texture2D  # only for base
