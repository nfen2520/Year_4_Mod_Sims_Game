extends Node
class_name Dialogue

@export var Condition_Resource : Conditions
var yes : bool = true

func collect():
	yes = true
	test()
	if yes:
		return Condition_Resource.outcome.action()

func exit():
	yes = true
	test()
	if yes:
		Condition_Resource.outcome.stop()
		
func test():
	for i in Condition_Resource.condition:
		if not WorldRoot.check_event(i):
			yes = false
