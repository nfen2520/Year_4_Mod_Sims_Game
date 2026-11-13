extends Node
class_name Dialogue

@export var Condition_Resource : Conditions
@export var display_text : String = "Press E to talk"
var yes : bool = true

func collect():
	yes = true
	test()
	if yes:
		return Condition_Resource.outcome.action(1)

func exit():
	yes = true
	test()
	if yes:
		Condition_Resource.outcome.stop()
func retur():
	pass
func test():
	for i in Condition_Resource.condition:
		if not WorldRoot.check_event(i):
			yes = false
