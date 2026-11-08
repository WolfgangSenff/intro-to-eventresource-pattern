class_name HurtPlayerComponent
extends ComponentBase

@export var body: CharacterBody2D
@export var animation_player: AnimationPlayer
@export var knockback_speed := 200.0
@export var knockback_lift := -150.0
@export var knockback_duration := 0.25

var time_left = 0.0

func _on_event(...args: Array) -> void:
	animation_player.play("hurt")
	if args:
		knock_back_from(args[0])

func knock_back_from(from: Vector2) -> void:
	var away = signf(body.global_position.x - from.x)
	body.velocity = Vector2(away * knockback_speed, knockback_lift)
	time_left = knockback_duration
	body.set_physics_process(false)

func _physics_process(delta: float) -> void:
	if time_left <= 0.0:
		return

	time_left -= delta
	body.velocity += body.get_gravity() * delta

	if time_left <= 0.0:
		body.set_physics_process(true)
