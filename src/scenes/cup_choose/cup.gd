@tool
class_name Cup
extends TextureButton


@onready var spilled_sprite := $Tea as TextureRect


@export var cup_data: CupData:
	set(value):
		cup_data = value
		if not is_node_ready():
			await ready
		if not is_instance_valid(cup_data):
			texture_normal = null
			texture_click_mask = null
			return
		texture_normal = cup_data.sprite
		texture_click_mask = cup_data.click_mask


func spill_tea(tea_base: TeaIngredient) -> void:
	spilled_sprite.texture = tea_base.tea_in_cup


func empty_cup() -> void:
	spilled_sprite.texture = null
