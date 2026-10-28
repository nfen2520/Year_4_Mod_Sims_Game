extends Area3D

enum World{
	World_0 = 0,
	World_1 = 1,
	World_2 = 2,
	World_3 = 3,
	World_4 = 4,
	}

@export var scene : WorldSelect

func _on_body_entered(body):
	if body.is_in_group("Player"):
		WorldRoot.change_scene(scene)
