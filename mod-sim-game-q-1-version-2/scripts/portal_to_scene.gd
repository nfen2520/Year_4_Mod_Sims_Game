extends Area3D

@export var scene : WorldSelect

func _on_body_entered(body):
	if body.is_in_group("Player"):
		WorldRoot.change_scene(scene.scene)
