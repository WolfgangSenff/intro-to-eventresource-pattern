extends CharacterBody2D

@export var speed := 120.0
@export var jump_velocity := -300.0
@export var dashed: LocalEvent

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("dash"):
		dashed.event.emit()
		return

	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	if direction != 0:
		%Sprite2D.scale.x = -1 if direction < 0 else 1

	if not is_on_floor():
		play("jump")
	elif direction != 0:
		play("walk")
	else:
		play("idle")

	move_and_slide()

func play(animation: String) -> void:
	%AnimationPlayer.play(animation)
