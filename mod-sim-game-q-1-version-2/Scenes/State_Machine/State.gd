@abstract
extends Resource
class_name State

const gravity: float = 9.8

var body: CharacterBody3D = null

@abstract
func enter()

@abstract
func exit()

func switch(state_name: String):
	if body:
		body.activate_state.exit()
		body.switch_state(state_name)
		body.activate_state.enter()
