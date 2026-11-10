extends Control

enum World{
	World_0 = 0,
	World_1 = 1,
	World_2 = 2,
	World_3 = 3,
	World_4 = 4,
	}


@export var world : World

func _on_start_pressed():
	WorldRoot.create_game(true)
	queue_free()


func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	print("no")



func _on_load_pressed():
	WorldRoot.create_game(true)
	EventBus.load_game.emit()
	queue_free()
