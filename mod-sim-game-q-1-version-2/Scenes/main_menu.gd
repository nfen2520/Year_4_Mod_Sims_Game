extends Control

enum World{
	World_0 = 0,
	World_1 = 1,
	World_2 = 2,
	World_3 = 3,
	World_4 = 4,
	}


@export var world : World
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_start_pressed():
	WorldRoot.start_game()
	queue_free()


func _on_exit_pressed():
	get_tree().quit()


func _on_Load_pressed():
	pass
