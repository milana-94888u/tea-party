@tool
class_name Cup
extends Control


@onready var sprite_node := $CupSprite as TextureRect


@export var data: CupData:
	set(new_data):
		data = new_data
		if not is_node_ready():
			await ready
		if is_instance_valid(data):
			sprite_node.texture = data.sprite
		else:
			sprite_node.texture = null
