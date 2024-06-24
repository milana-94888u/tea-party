@tool
class_name CharacterData
extends Resource


@export var name: String
@export var desired_effects: Array[TeaIngredient.TeaEffect]
@export var undesired_effects: Array[TeaIngredient.TeaEffect]


@export var back_sprite_base: Texture2D
@export var front_sprite_base: Texture2D
@export var back_sprite_tea: Texture2D
@export var front_sprite_tea: Texture2D

@export var cup_spot: Vector2 = Vector2.ZERO
