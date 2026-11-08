class_name TurnAroundComponent
extends Node2D

@export var facing: Node2D

func _physics_process(_delta: float) -> void:
	if not %LedgeCast.is_colliding() or %WallCast.is_colliding():
		facing.scale.x = -facing.scale.x
