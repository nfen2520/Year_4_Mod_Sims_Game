extends Node
class_name Collectionable

@export var Condition_Resource : Conditions
var yes : bool = true

func collect():
	yes = true
	for i in Condition_Resource.condition:
		if not WorldRoot.check_event(i):
			yes = false
	if yes:
		Condition_Resource.outcome.action(self)
