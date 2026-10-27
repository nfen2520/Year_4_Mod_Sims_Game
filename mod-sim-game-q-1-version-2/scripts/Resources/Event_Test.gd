extends Node
class_name Placeholder

@export var Condition_Resource : Conditions
@export var give : Conditional
var yes : bool = true

func collect():
	for i in Condition_Resource.condition:
		if WorldRoot.check_event(i):
			yes = true
		else:
			yes = false
			break
	if yes:
		print("hello my good sur")
		Condition_Resource.outcome.action()
		WorldRoot.push_event(give)
