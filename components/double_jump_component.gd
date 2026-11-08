class_name DoubleJumpComponent
extends ComponentBase

@export var jump: JumpComponent
@export_range(0.0, 1.0) var strength := 0.85
@export var air_jumps := 1

var jumps_left = 0

func _on_event(..._args: Array) -> void:
	var falling = jump.body.velocity.y > 0.0 and not jump.body.is_on_floor()
	if falling and jumps_left > 0:
		jumps_left -= 1
		jump.body.velocity.y = jump.jump_velocity * strength

func _physics_process(_delta: float) -> void:
	if jump.body.is_on_floor():
		jumps_left = air_jumps
