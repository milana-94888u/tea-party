class_name Sounds
extends Node


static var book_open := preload("res://assets/audio/book_open.ogg")
static var book_close := preload("res://assets/audio/book_close.ogg")
static var button := preload("res://assets/audio/button.ogg")
static var collecting_ingredient1 := preload("res://assets/audio/collecting_ingredient1.ogg")
static var collecting_ingredient2 := preload("res://assets/audio/collecting_ingredient2.ogg")
static var drinking_tea := preload("res://assets/audio/drinking_tea.ogg")
static var page_flip := preload("res://assets/audio/page_flip.ogg")
static var picking_up_cup := preload("res://assets/audio/picking_up_cup.ogg")
static var pouring_ingredients := preload("res://assets/audio/pouring_ingredients.ogg")
static var putting_down_cup := preload("res://assets/audio/putting_down_cup.ogg")
static var tea_pour := preload("res://assets/audio/tea_pour.ogg")


func play_sound_effect(stream: AudioStream) -> void:
	var player := AudioStreamPlayer.new()
	player.stream = stream
	add_child.call_deferred(player)
	await player.tree_entered
	player.play()
	await player.finished
	remove_child.call_deferred(player)
