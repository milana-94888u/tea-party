extends Control


@export var introduction_dialog: DialogData


func _ready() -> void:
	await display_dialog(%Mel, introduction_dialog)
	for character in characters:
		await display_dialog(character, null, true)


@export var highlight_material: Material

@onready var cup_dialog := %CupDialog as CupDialog

@onready var characters: Array[Character] = [%Selene, %Brokk, %Mel, %Vivienne, %Liam, %Om]
@onready var canvas_for_ui := $CanvasForUI as CanvasLayer
@onready var darkening_light := $DarkeningLight as DirectionalLight2D


func display_dialog(character: Character, dialog: DialogData, display_cup_dialog := false) -> void:
	var tween := create_tween()
	character.material = highlight_material
	tween.tween_property(darkening_light, "energy", 0.5, 1)
	await tween.finished
	if is_instance_valid(dialog):
		var dialog_line := preload("res://src/scenes/ui/dialog_line.tscn").instantiate()
		canvas_for_ui.add_child(dialog_line)
		for line in dialog.lines:
			dialog_line.dialog_line_data = line
			await dialog_line.requested_next_line
		dialog_line.queue_free()
	if display_cup_dialog:
		cup_dialog.show()
		var cup: Cup = await cup_dialog.cup_chosen
		character.give_cup(cup)
	tween = create_tween()
	tween.tween_property(darkening_light, "energy", 0, 1)
	await tween.finished
	character.material = null


func choose_tea() -> Tea:
	var shelves := preload("res://src/scenes/tea_choose/shelves.tscn").instantiate()
	hide()
	add_sibling.call_deferred(shelves)
	shelves.show()
	var tea: Tea = await shelves.tea_completed
	shelves.queue_free()
	show()
	return tea


