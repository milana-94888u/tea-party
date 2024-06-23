class_name Tea
extends Resource


@export var base: TeaIngredient
@export var flowers: TeaIngredient
@export var fruit_bits: TeaIngredient


static func make_tea(tea_base: TeaIngredient, tea_flowers: TeaIngredient, tea_fruit_bits: TeaIngredient) -> Tea:
	var tea = Tea.new()
	if (not is_instance_valid(tea_base)) or tea_base.ingredient_type != TeaIngredient.IngredientType.BASE:
		return null
	tea.base = tea_base
	if (not is_instance_valid(tea_flowers)) or tea_flowers.ingredient_type != TeaIngredient.IngredientType.FLOWERS:
		return null
	tea.flowers = tea_flowers
	if (not is_instance_valid(tea_fruit_bits)) or tea_fruit_bits.ingredient_type != TeaIngredient.IngredientType.FRUIT_BITS:
		return null
	tea.fruit_bits = tea_fruit_bits
	return tea
