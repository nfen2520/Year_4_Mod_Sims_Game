extends Outcome
class_name Dialogue_Return

@export_file("*.json") var jsonsrc

func action():
	print("hi")
	return jsonsrc

func stop():
	pass
