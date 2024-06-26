class_name CupDialog
extends Control


signal cup_chosen(cup: Cup)


@onready var cups := $Cups as HBoxContainer


func _ready() -> void:
	for cup in cups.get_children():
		cup.pressed.connect(on_cup_clicked.bind(cup))


func on_cup_clicked(cup: Cup) -> void:
	SfxPlayer.play_sound_effect(Sounds.picking_up_cup)
	cup_chosen.emit(cup)
