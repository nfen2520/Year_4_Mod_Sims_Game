extends Outcome
class_name push

@export var give : Conditional

func action(_arg):
	WorldRoot.push_event(give)
	EventBus.Top_Text.emit("you got " + give.text, 4)
	pass

func stop():
	pass
