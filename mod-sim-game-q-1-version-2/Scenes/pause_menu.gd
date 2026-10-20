extends CanvasLayer

var menu = self

signal play
signal load
signal save
signal pause
var hold : bool = false
# Called when the node enters the scene tree for the first time.

func _on_continue_pressed():
	end()


func _on_save_pressed():
	EventBus.save_game.emit()
	emit_signal("save")
	


func _on_exit_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_exit_pressed():
	get_tree().quit()



func _on_load_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	menu.visible = false
	emit_signal("play")
	emit_signal("load")
	EventBus.load_game.emit()

func _on_player_pause():
	hold = true
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		if menu.visible == true:
			end()
		else:
			st()
			
			
func end():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	menu.visible = false
	get_tree().paused = false
	emit_signal("play")

func st():
	if not hold: 
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		menu.visible = true
		emit_signal("pause")
		get_tree().paused = true


func _on_dialogue_manager_menu():
	hold = false
