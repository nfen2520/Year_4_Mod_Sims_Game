extends Node3D

@export var world0 : PackedScene
@export var world1 : PackedScene
@export var world2 : PackedScene
@export var player_scene : PackedScene
var current : Node3D = null
var current_world : int = 0
var dict : Dictionary = {}
var right : int = 0
var player 
func _ready():
	EventBus.save_scene.connect(store)
	EventBus.picked_up.connect(score)
	
func change_scene(world):
	if world == 0:
		load_scene(world0)
		current_world = 0
	elif world == 1:
		load_scene(world1)
		current_world = 1
	elif world == 2:
		load_scene(world2)
		current_world = 2

func load_scene(arg: PackedScene):
	var new_world = arg.instantiate()
	add_child(new_world)
	remove_current()
	EventBus.move_scene.emit(dict)
	current = new_world
	if current.has_method("hi"):
		if current.hi() != null:
			player.global_transform = current.hi()
	
	
func remove_current():
	if current:
		current.queue_free()
	
func store(who, who2, what):
	if dict.has(who):
		dict[who][who2] = what
	else:
		dict[who] = {}
		dict[who][who2] = what

func score(arg):
	var value = right + arg
	right = value
	dict["score"] = value

func save():
	dict["world"] = current_world
	return dict
	
func set_save(arg):
	dict = arg
	change_scene(dict["world"])

func start_game():
	player = player_scene.instantiate()
	add_child(player)
	change_scene(0)
	pass
