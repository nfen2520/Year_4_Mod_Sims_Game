extends Outcome
class_name Teleport

@export var world : WorldSelect

func action(arg):
	print("teleport")
	WorldRoot.change_scene(world.scene)
func stop():
	pass
