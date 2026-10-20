class_name SaveLoad
extends Node

func _ready():
	EventBus.load_game.connect(_load)
	EventBus.save_data.connect(_save_data)

func _load():
	var file2 = FileAccess.open("user://save_world.dat", FileAccess.READ)
	var saved_dict = file2.get_var()
	WorldRoot.set_save(saved_dict)
	print(str(saved_dict))
	file2.close()
	var file = FileAccess.open("user://savegame.dat", FileAccess.READ)
	var saved_data = file.get_var()
	WorldRoot.change_scene(saved_data["scene"])
	EventBus.player_move.emit(saved_data)
	file.close()



func _save_data(dict) -> void:
	var file = FileAccess.open("user://savegame.dat", FileAccess.WRITE)
	file.store_var(dict)
	print("hola")
	file.close()
	var file2 = FileAccess.open("user://save_world.dat", FileAccess.WRITE)
	file2.store_var(WorldRoot.save())
	print("hi")
	print(str(WorldRoot.save()))
	file2.close()
