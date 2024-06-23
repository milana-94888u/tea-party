extends Control


signal tea_completed(tea: Tea)


@onready var base_grid := %Base as GridContainer
@onready var flower_grid := %Flower as GridContainer
@onready var fruit_bits_grid := %FruitBits as GridContainer


@onready var base_spot := %BaseSpot as Control
@onready var flower_spot := %FlowerSpot as Control
@onready var fruit_bits_spot := %FruitBitsSpot as Control


@onready var finish_button := %FinishButton


@onready var closed_book := $ClosedBook as TextureButton
@onready var open_book := $OpenBook as Control

var closed_book_initial_position := Vector2(0, 824)
var closed_book_hovered_position := Vector2(0, 568)


func check_completed() -> void:
	if base_spot.get_child_count() and flower_spot.get_child_count() and fruit_bits_spot.get_child_count():
		finish_button.disabled = false
	else:
		finish_button.disabled = true


func return_ingredient_back(ingredient: TeaIngredientButton) -> void:
	ingredient.reparent(ingredient.original_spot, false)
	ingredient.original_spot = null


func get_spot_for_ingredient(ingredient_data: TeaIngredient) -> Control:
	match ingredient_data.ingredient_type:
		TeaIngredient.IngredientType.BASE:
			return base_spot
		TeaIngredient.IngredientType.FLOWERS:
			return flower_spot
		TeaIngredient.IngredientType.FRUIT_BITS:
			return fruit_bits_spot
	return null


func on_ingredient_clicked(ingredient: TeaIngredientButton) -> void:
	if is_instance_valid(ingredient.original_spot):
		return_ingredient_back(ingredient)
		return
	var spot_to_put := get_spot_for_ingredient(ingredient.ingredient_data)
	if spot_to_put.get_child_count():
		return_ingredient_back(spot_to_put.get_child(0))
	ingredient.original_spot = ingredient.get_parent()
	ingredient.reparent(spot_to_put, false)
	check_completed()


func connect_buttons_from_grid(grid: GridContainer) -> void:
	for spot in grid.get_children():
		var button: TeaIngredientButton = spot.get_child(0)
		button.pressed.connect(on_ingredient_clicked.bind(button))


func _ready() -> void:
	connect_buttons_from_grid(base_grid)
	connect_buttons_from_grid(flower_grid)
	connect_buttons_from_grid(fruit_bits_grid)


func _on_closed_book_pressed() -> void:
	closed_book.hide()
	open_book.show()
	await open_book.hidden
	closed_book.show()


func _on_closed_book_mouse_entered() -> void:
	var tween := closed_book.create_tween()
	tween.tween_property(closed_book, "position", closed_book_hovered_position, 0.4)


func _on_closed_book_mouse_exited() -> void:
	var tween := closed_book.create_tween()
	tween.tween_property(closed_book, "position", closed_book_initial_position, 0.4)


func _on_finish_button_pressed() -> void:
	tea_completed.emit(Tea.make_tea(
		base_spot.get_child(0).ingredient_data,
		flower_spot.get_child(0).ingredient_data,
		fruit_bits_spot.get_child(0).ingredient_data,
	))
