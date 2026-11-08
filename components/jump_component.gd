class_name JumpComponent
extends ComponentBase

@export var body: CharacterBody2D
@export var jump_velocity := -300.0

func _on_event(..._args: Array) -> void:
	if body.is_on_floor():
		body.velocity.y = jump_velocity
