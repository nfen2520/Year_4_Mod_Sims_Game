extends CharacterBody3D

enum World{
	World_0 = 0,
	World_1 = 1,
	World_2 = 2,
	World_3 = 3,
	World_4 = 4,
	}
@export var id : World
@export var bullet : PackedScene
@export var interact: CanvasLayer
@export var shoot : Marker3D
var player = self
@export var dot: CanvasLayer
@onready var camera = %Camera3D
@export var bar : Label
signal dialogue_start(file: String)
var SPEED = 5.5
signal pause
signal light(arg: bool)
var dialogue: bool = false
var path = null
var direction = null


func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * 0.5
		%Camera3D.rotation_degrees.x -= event.relative.y * 0.2
		%Camera3D.rotation_degrees.x = clamp(
			%Camera3D.rotation_degrees.x, -60.0, 80.0
		)
	if event.is_action_pressed("inter") and dialogue == true:
		dialogue_start.emit(path)
		pause.emit()
	if event.is_action_pressed("attack"):
		var instance = bullet.instantiate()
		instance.position = shoot.global_position
		instance.transform.basis = shoot.global_transform.basis
		get_parent().add_child(instance)
		
		

func _ready():
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	add_to_group("Player")
	light.emit(false)
	EventBus.player_move.connect(_load)
	


func _load(saved_data):
	print("load")
	player.set_position(saved_data["player_pos"])
	player.rotate_y(saved_data["player_y"] - player.rotation.y)
	camera.rotate_x(saved_data["camera_x"] - camera.rotation.x)
	player.rotate_x(saved_data["player_x"] - player.rotation.x)
	camera.rotate_y(saved_data["camera_y"] - camera.rotation.y)

func _physics_process(delta):
	
	var input_direction_2D = Input.get_vector(
		"move_left","move_right","move_forward","move_back"	
		)
	var input_direction_3D = Vector3(
		input_direction_2D.x, 0.0, input_direction_2D.y
	)
	direction = transform.basis * input_direction_3D
	
	if Input.is_action_just_pressed('dash'):	SPEED = 9.5
	elif Input.is_action_just_released("dash"):	SPEED = 5.5
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	
	velocity.y -= 20.0 * delta
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = 10
	elif Input.is_action_just_released("jump") and velocity.y > 3:
		velocity.y = 3
	
	move_and_slide()
	
func _on_pause_menu_play():
	_play()


func _on_pause_menu_save() -> void:
	var dict = {}
	dict["camera_x"] = camera.rotation.x
	dict["camera_y"] = camera.rotation.y
	dict["player_x"] = rotation.x
	dict["player_y"] = rotation.y
	dict["scene"] = id
	dict["player_pos"] = player.position
	EventBus.save_data.emit(dict)
	pass # Replace with function body.


func _on_pause_menu_pause():
	_pause()


func _on_dialogue_manager_pause() -> void:
	_pause()


func _on_dialogue_manager_play() -> void:
	_play()


func _on_player_reach_body_entered(body):
	if body.is_in_group("Interactable"):
		if body.has_method("hi"):
			path = body.hi()
			dialogue = true
			interact.show()
	if body.is_in_group("Collectable"):
		print("hola")

func _on_player_reach_body_exited(body: Node3D) -> void:
	if body.is_in_group("Interactable"):
		path = null
		dialogue = false
		interact.hide()
		
func _pause():
	dot.visible = false
	bar.visible = false
	
func _play():
	dot.visible = true
	bar.visible = true
	get_tree().paused = false
