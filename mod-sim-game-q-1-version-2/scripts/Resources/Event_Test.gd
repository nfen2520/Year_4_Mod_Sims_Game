extends Node
class_name Placeholder

@export var Condition_Resource : Conditions
var yes : bool = true

func collect():
	for i in Condition_Resource.condition:
		if not WorldRoot.check_event(i):
			print("hi")
			yes = false
	if yes:
		Condition_Resource.outcome.action()
