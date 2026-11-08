class_name AnimationReactionComponent
extends ComponentBase

@export var animation_name: String
@export var animation_player: AnimationPlayer

func _on_event(..._args: Array) -> void:
	animation_player.play(animation_name)
