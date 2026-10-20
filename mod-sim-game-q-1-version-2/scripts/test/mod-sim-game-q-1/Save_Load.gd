class_name SaveLoad
extends Node
@onready var player = $".."
@onready var camera = %Camera3D



func _on_pause_menu_load():
	
	var file = FileAccess.open("user://savegame.dat", FileAccess.READ)
	
	var saved_data = file.get_var()
	player.set_position(saved_data["player_pos"])
	player.rotate_y(saved_data["player_y"] - player.rotation.y)
	camera.rotate_x(saved_data["camera_x"] - camera.rotation.x)
	player.rotate_x(saved_data["player_x"] - player.rotation.x)
	camera.rotate_y(saved_data["camera_y"] - camera.rotation.y)
	file.close()



func _on_player_save_pos(cx: Variant, cy: Variant, px: Variant, py: Variant) -> void:
	var file = FileAccess.open("user://savegame.dat", FileAccess.WRITE)
	var saved_data = {}
	saved_data["camera_x"] = px
	saved_data["camera_y"] = py
	saved_data["player_x"] = cx
	saved_data["player_y"] = cy
	

	saved_data["player_pos"] = player.global_position
	
	file.store_var(saved_data)
	file.close()
