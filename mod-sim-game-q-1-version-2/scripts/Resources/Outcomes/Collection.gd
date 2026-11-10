extends Outcome
class_name collectable

@export var value : int

func action(_arg):
	var arg = _arg
	EventBus.death.emit(arg.name, false)
	EventBus.picked_up.emit(value)
	arg.queue_free()

func stop():
	pass
