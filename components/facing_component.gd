class_name FacingComponent
extends ComponentBase

@export var sprite: Node2D

func _on_event(...args: Array) -> void:
	var direction = args[0]
	sprite.scale.x = -1 if direction < 0 else 1
