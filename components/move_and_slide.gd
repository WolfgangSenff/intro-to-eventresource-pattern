class_name MoveAndSlideComponent
extends Node

@export var body: CharacterBody2D

func _physics_process(_delta: float) -> void:
	body.move_and_slide()
