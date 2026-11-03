extends Outcome
class_name Teleport

@export var world : WorldSelect

func action():
	print("teleport")
	WorldRoot.change_scene(world.scene)
func stop():
	pass
