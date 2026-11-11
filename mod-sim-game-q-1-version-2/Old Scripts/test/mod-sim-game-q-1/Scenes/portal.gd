extends Area3D

signal portal

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.set_position($Marker3D.global_position)
		emit_signal("portal")
