extends CharacterBody2D

@export var speed := 120.0
@export var dashed: LocalEvent
@export var moved: LocalEvent
@export var jumped: LocalEvent
@export var double_jumped: LocalEvent
@export var walked: LocalEvent
@export var idled: LocalEvent
@export var airborne: LocalEvent

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("dash"):
		dashed.event.emit()
		return
		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			jumped.event.emit()
		else:
			double_jumped.event.emit()

	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	if direction != 0:
		moved.event.emit(direction)

	if not is_on_floor():
		airborne.event.emit()
	elif direction != 0:
		walked.event.emit()
	else:
		idled.event.emit()
