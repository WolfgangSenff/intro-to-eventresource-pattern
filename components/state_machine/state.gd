class_name State
extends Node

@warning_ignore("unused_signal")
signal finished()

var machine: StateMachine

func enter() -> void:
	pass

func exit() -> void:
	finished.emit()

func get_input(_delta: float) -> Dictionary:
	return {}

func update(_input: Dictionary, _delta: float) -> void:
	pass
