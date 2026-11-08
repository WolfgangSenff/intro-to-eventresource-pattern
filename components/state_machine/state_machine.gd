class_name StateMachine
extends Node

signal state_changed(previous: State, next: State)

@export var actor: Node
@export var initial_state: State

var current_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			child.machine = self
	change_state.call_deferred(initial_state)

func change_state(next_state: State) -> void:
	var previous = current_state
	if previous:
		previous.exit()
	current_state = next_state
	state_changed.emit(previous, next_state)
	next_state.enter()

func _physics_process(delta: float) -> void:
	if current_state:
		var input = current_state.get_input(delta)
		current_state.update(input, delta)
