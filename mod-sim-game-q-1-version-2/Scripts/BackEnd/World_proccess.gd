extends Node3D

@export var spawn : Marker3D

enum world{
	world0 = 0,
	world1 = 1,
	world2 = 2,
	world3 =3
}

@export var me : world
# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.move_scene.connect(_load)
	EventBus.death.connect(_save)

func _load(dict):
	var nodes = get_tree().get_nodes_in_group("Collectable")
	if dict.has(str(me)):
		for one in nodes:
			if dict[str(me)].has(one.name):
				one.queue_free()

func _save(who, what):
	EventBus.save_scene.emit(str(me), who, what)
	
func hi():
	if spawn != null:
		return spawn.global_transform
