class_name GravityComponent
extends Node

@export var body: CharacterBody2D

func _physics_process(delta: float) -> void:
	body.velocity += body.get_gravity() * delta
