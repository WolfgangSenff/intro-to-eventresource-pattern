class_name HurtPlayerAreaComponent
extends Area2D

@export var hurt_player: EventResource
@export var knocks_back := true

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body: Node2D) -> void:
	if knocks_back:
		hurt_player.event.emit(global_position)
	else:
		hurt_player.event.emit()
