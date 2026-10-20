extends Control

@export var menu: CanvasLayer

signal play
signal load
signal save
signal pause
# Called when the node enters the scene tree for the first time.

func _on_continue_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	menu.visible = false
	emit_signal("play")


func _on_save_pressed():
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

func _on_player_pause():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	menu.visible = true
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		if menu.visible == true:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			menu.visible = false
			emit_signal("play")
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			menu.visible = true
			emit_signal("pause")
