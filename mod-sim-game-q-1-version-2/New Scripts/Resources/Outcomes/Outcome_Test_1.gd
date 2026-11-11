extends Outcome
class_name push

@export var give : Conditional

func action(_arg):
	WorldRoot.push_event(give)
	pass

func stop():
	pass
