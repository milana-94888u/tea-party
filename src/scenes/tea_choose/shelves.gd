extends Control


@onready var closed_book := $ClosedBook as TextureButton
@onready var open_book := $OpenBook as Control

var closed_book_initial_position := Vector2(0, 952)
var closed_book_hovered_position := Vector2(0, 568)


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
