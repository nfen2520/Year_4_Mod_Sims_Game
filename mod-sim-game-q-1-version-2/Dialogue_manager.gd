extends Control


signal pause
signal play
signal menu
@export_file("*.json") var jsonsrc
var scene_script : Dictionary
var current_block : Dictionary
var next_block : Dictionary
var close_block : bool
@export var dialogue : CanvasLayer
@export var pause_menu : CanvasLayer

@export_category("scene reference")
@export var char_text : Label
@export var char_name : Label
@export var char_sprite : TextureRect

@export var BaseLayer : CanvasLayer
@export var ChoiceLayer : CanvasLayer

func dia(value) -> void:
	emit_signal("pause")
	get_json(value)
	load_block(current_block)


func get_json(scr: String):
	var jsontext = FileAccess.get_file_as_string(scr)
	scene_script = JSON.parse_string(jsontext)
	current_block = scene_script["start"]

func load_block(block : Dictionary):
	emit_signal("pause")
	dialogue.visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if block.has("text"):	char_text.text = block["text"]
	if block.has("name"):	char_name.text = block["name"]
	
	if block.has("next"):
		var key = block["next"]
		if scene_script.has(key):	next_block = scene_script[key]
	if block.has("choices"):
		ChoiceLayer.visible = true
		ChoiceLayer.set_choices(block["choices"])
	if block.has("sprite"):
		char_sprite.set_emote(block["sprite"])
	if block.has("close"):
		close_block = true
	pass

func next():
	if pause_menu.visible == true:
		return
	else:
		if close_block:
			close_dia()
			return
		current_block = next_block
		load_block(current_block)
	
func _input(event):
	if event.is_action_pressed("advace_dialogue") and dialogue.visible == true:
		next()

	if event.is_action_pressed("close_dialogue"):
		close_dia()
	pass


func _on_choices_next_id(id: String) -> void:
	next_block = scene_script[id]
	next()
	ChoiceLayer.hide()
	pass # Replace with function body.
func close_dia():
	ChoiceLayer.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pause_menu.visible = false
	dialogue.visible = false
	emit_signal("play")
	menu.emit()
	close_block = false
	get_tree().paused = false




func _on_player_dialogue_start(file: String) -> void:
	dia(file)
