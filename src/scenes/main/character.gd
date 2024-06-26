@tool
class_name Character
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
var was_upset := false
var returned_back := false


func set_correct_sprites() -> void:
	if not is_node_ready():
		await ready
	if not is_instance_valid(character_data):
		back_sprite.texture = null
		front_sprite.texture = null
		return
	cup_spot.position = character_data.cup_spot
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


@export var cup_dialog: DialogData
@export var upset_dialog: DialogData
@export var back_to_normal_dialog: DialogData
@export var happy_dialog: DialogData
@export var filler_phrases_bad: Array[DialogData]
@export var filler_phrases_normal: Array[DialogData]
@export var filler_phrases_good: Array[DialogData]


func give_cup(cup: Cup) -> void:
	SfxPlayer.play_sound_effect(Sounds.putting_down_cup)
	cup.reparent(cup_spot, false)
	cup.position = Vector2.ZERO
	has_cup = true


func spill_tea(tea: Tea) -> void:
	(cup_spot.get_child(0) as Cup).spill_tea(tea)


func consume_and_evaluate_tea(tea: Tea) -> DialogData:
	(cup_spot.get_child(0) as Cup).empty_cup()
	SfxPlayer.play_sound_effect(Sounds.drinking_tea)
	var score := 0
	for effect in [tea.base.effect, tea.flowers.effect, tea.fruit_bits.effect]:
		if effect in character_data.desired_effects:
			score += 1
		elif effect in character_data.undesired_effects:
			score -= 1
	
	if score < - 1:
		if state == CharacterState.INITIAL and not was_upset:
			was_upset = true
			state = CharacterState.UPSET
			return upset_dialog
		elif state == CharacterState.HAPPY and not was_upset:
			was_upset = true
			return upset_dialog
		return filler_phrases_bad.pick_random() if filler_phrases_bad else null
	elif score > 1:
		if state == CharacterState.UPSET:
			state = CharacterState.INITIAL
			returned_back = true
			return back_to_normal_dialog
		elif state == CharacterState.INITIAL:
			state = CharacterState.HAPPY
			return happy_dialog
		return filler_phrases_good.pick_random() if filler_phrases_good else null
	else:
		if state == CharacterState.UPSET:
			state = CharacterState.INITIAL
			returned_back = true
			return back_to_normal_dialog
		elif state == CharacterState.HAPPY and not returned_back:
			returned_back = true
			return back_to_normal_dialog
		return filler_phrases_normal.pick_random() if filler_phrases_normal else null






















