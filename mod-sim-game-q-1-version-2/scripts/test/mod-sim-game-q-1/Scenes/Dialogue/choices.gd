extends CanvasLayer

@export var b_group : ButtonGroup
var dia_choices
signal next_id(id : String)
func _ready() -> void:
	b_group.pressed.connect(get_choices)
	

func set_choices(choices: Dictionary):
	dia_choices = choices
	print(choices)
	var index = 0
	var buttons = b_group.get_buttons()
	
	for c in choices.keys():
		print(c)
		buttons[index].text = c
		buttons[index].visible = true
		index += 1
	pass
	
func get_choices(b : Button):
	var id = dia_choices[b.text]
	next_id.emit(id)
	pass
