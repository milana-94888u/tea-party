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

@export var effect: TeaEffect
@export var ingredient_type: IngredientType
