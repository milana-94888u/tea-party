class_name Sounds
extends Node


@export var book_open := preload("res://assets/audio/book_open.ogg")
@export var book_close := preload("res://assets/audio/book_close.ogg")
@export var button := preload("res://assets/audio/button.ogg")
@export var collecting_ingredient1 := preload("res://assets/audio/collecting_ingredient1.ogg")
@export var collecting_ingredient2 := preload("res://assets/audio/collecting_ingredient2.ogg")
@export var drinking_tea := preload("res://assets/audio/drinking_tea.ogg")
@export var page_flip := preload("res://assets/audio/page_flip.ogg")
@export var picking_up_cup := preload("res://assets/audio/picking_up_cup.ogg")
@export var pouring_ingredients := preload("res://assets/audio/pouring_ingredients.ogg")
@export var putting_down_cup := preload("res://assets/audio/putting_down_cup.ogg")
@export var tea_pour := preload("res://assets/audio/tea_pour.ogg")


func play_sound_effect(stream: AudioStream) -> void:
	var player := AudioStreamPlayer.new()
	player.stream = stream
	add_child.call_deferred(player)
	await child_entered_tree
	player.play()
	await player.finished
	remove_child.call_deferred(player)
