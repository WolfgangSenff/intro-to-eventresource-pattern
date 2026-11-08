class_name ComponentBase
extends Node

@export var game_event: EventResource

func _ready() -> void:
	game_event.event.connect(_on_event)

func _on_event(..._args: Array) -> void:
	pass
