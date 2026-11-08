class_name Utils
extends Object


static func decide(probability: float) -> bool:
	return randf() < probability


static func rand_point_in_circle(radius: float) -> Vector2:
	return Vector2.from_angle(randf() * TAU) * sqrt(randf()) * radius


static func shuffled(array: Array) -> Array:
	var copy = array.duplicate()
	copy.shuffle()
	return copy


static func is_tween_running(tween: Tween) -> bool:
	return tween != null and tween.is_valid() and tween.is_running()


static func kill_tween(tween: Tween) -> void:
	if is_tween_running(tween):
		tween.kill()


static func tween_bounce(node: Node2D, height: float = 2.0, duration: float = 0.1) -> Tween:
	var tween = node.create_tween().set_loops()
	tween.tween_property(node, "position:y", -height, duration * 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(node, "position:y", 0.0, duration * 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	return tween


static func tween_hop(node: Node2D, distance: float, direction: Vector2, duration: float = 0.4, squash: Vector2 = Vector2(0.9, 1.1)) -> Tween:
	var tween = node.create_tween().set_parallel()
	tween.tween_property(node, "position", node.position + direction.normalized() * distance, duration).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(node, "scale", squash, duration * 0.25).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.chain().tween_property(node, "scale", Vector2.ONE, duration * 0.75).set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	return tween


static func align_with_y(xform: Transform3D, new_y: Vector3) -> Transform3D:
	xform.basis.y = new_y
	xform.basis.x = -xform.basis.z.cross(new_y)
	xform.basis = xform.basis.orthonormalized()
	return xform
