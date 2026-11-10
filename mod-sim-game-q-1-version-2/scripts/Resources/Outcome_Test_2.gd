extends Outcome
class_name Teleport

@export var world : WorldSelect

func action(_arg):
	WorldRoot.change_scene(world.scene)
func stop():
	pass
