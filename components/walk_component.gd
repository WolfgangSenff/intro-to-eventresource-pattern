class_name WalkComponent
extends Node

@export var body: CharacterBody2D
@export var facing: Node2D
@export var speed := 40.0

func _physics_process(_delta: float) -> void:
	body.velocity.x = facing.scale.x * speed
