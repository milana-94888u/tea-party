extends Control


enum CharacterState {
	INITIAL,
	UPSET,
	HAPPY,
}


@onready var back_sprite := %CharacterBack as TextureRect
@onready var cup_spot := %CupSpot as Control
@onready var front_sprite := %CharacterFront as TextureRect


@export var state := CharacterState.INITIAL


@export var character_data: CharacterData

@export var introduction_dialog: Array[DialogLineData]
@export var upset_dialog: Array[DialogLineData]
@export var back_to_normal_dialog: Array[DialogLineData]
@export var happy_dialog: Array[DialogLineData]
@export var filler_phrases: Array[String]


func give_cup(cup: Cup) -> void:
	cup.reparent(cup_spot, false)


func evaluate_tea() -> void:
	pass
