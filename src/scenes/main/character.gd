extends Control


enum CharacterState {
	INITIAL,
	UPSET,
	HAPPY,
}


@export var state := CharacterState.INITIAL


@export var character_data: CharacterData

@export var introduction_dialog: Array[DialogLineData]
@export var upset_dialog: Array[DialogLineData]
@export var back_to_normal_dialog: Array[DialogLineData]
@export var happy_dialog: Array[DialogLineData]
@export var filler_phrases: Array[String]


@onready var cup_spot := $CupStop as Control


func give_cup(cup: Cup) -> void:
	cup.reparent(self, false)
