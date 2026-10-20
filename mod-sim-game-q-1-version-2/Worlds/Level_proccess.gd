extends Node3D
enum World{
	World_0 = 0,
	World_1 = 1,
	World_2 = 2,
	World_3 = 3,
	World_4 = 4,
	}
@export var id : World

var dict : Dictionary = {}

func _ready():
	EventBus.move_scene.connect(_load)
	EventBus.death.connect(_save)

func _load(saved_dict):
	var run = saved_dict.has("world1")
	var collectables = get_tree().get_nodes_in_group("Collectable")
	for one in collectables:
		if run:
			if saved_dict["world1"].has(one.name):	one.queue_free()

func _save(who, what):
	dict[who] = what
	EventBus.save_scene.emit( "world1", who, what)
