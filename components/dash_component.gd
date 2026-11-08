class_name DashComponent
extends ComponentBase

@export var body: CharacterBody2D
@export var facing: Node2D
@export var speed := 320.0
@export var duration := 0.15
@export var cooldown_time := 1.2

var cooldown_left = 0.0
var time_left = 0.0

func _on_event(..._args: Array) -> void:
	if cooldown_left >= cooldown_time:
		time_left = duration
		body.set_physics_process(false)
		cooldown_left = 0.0

func _physics_process(delta: float) -> void:
	if time_left <= 0.0:
		cooldown_left += delta
		return

	time_left -= delta
	body.velocity = Vector2(facing.scale.x * speed, 0.0)

	if time_left <= 0.0:
		body.set_physics_process(true)
