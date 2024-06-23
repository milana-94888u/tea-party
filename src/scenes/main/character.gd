@tool
extends Control


enum CharacterState {
	INITIAL,
	UPSET,
	HAPPY,
}


@export var has_cup := false:
	set(value):
		has_cup = value
		set_correct_sprites()


@onready var back_sprite := %CharacterBack as TextureRect
@onready var cup_spot := %CupSpot as Control
@onready var front_sprite := %CharacterFront as TextureRect


@export var state := CharacterState.INITIAL


func set_correct_sprites() -> void:
	if not is_node_ready():
		await ready
	if not is_instance_valid(character_data):
		back_sprite.texture = null
		front_sprite.texture = null
		return
	if has_cup:
		back_sprite.texture = character_data.back_sprite_tea
		front_sprite.texture = character_data.front_sprite_tea
	else:
		back_sprite.texture = character_data.back_sprite_base
		front_sprite.texture = character_data.front_sprite_base


@export var character_data: CharacterData:
	set(value):
		character_data = value
		set_correct_sprites()

@export var introduction_dialog: Array[DialogLineData]
@export var upset_dialog: Array[DialogLineData]
@export var back_to_normal_dialog: Array[DialogLineData]
@export var happy_dialog: Array[DialogLineData]
@export var filler_phrases: Array[String]


func give_cup(cup: Cup) -> void:
	cup.reparent(cup_spot, false)
	has_cup = true


func evaluate_tea() -> void:
	pass
