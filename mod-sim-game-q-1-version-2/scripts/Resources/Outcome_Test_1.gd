extends Outcome
class_name push

@export var give : Conditional

func action():
	WorldRoot.push_event(give)
	pass

func stop():
	pass
