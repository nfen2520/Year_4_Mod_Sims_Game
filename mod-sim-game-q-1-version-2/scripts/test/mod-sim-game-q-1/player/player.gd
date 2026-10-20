extends CharacterBody3D

@export var menu: Control
@export var dot: TextureRect

signal save_pos(cx ,cy ,px ,py)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * 0.5
		%Camera3D.rotation_degrees.x -= event.relative.y * 0.2
		%Camera3D.rotation_degrees.x = clamp(
			%Camera3D.rotation_degrees.x, -60.0, 80.0
		)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	add_to_group("Player")
	menu.visible = false


func _physics_process(delta):
	const SPEED = 5.5
	
	var input_direction_2D = Input.get_vector(
		"move_left","move_right","move_forward","move_back"	
		)
	var input_direction_3D = Vector3(
		input_direction_2D.x, 0.0, input_direction_2D.y
	)
	var direction = transform.basis * input_direction_3D
	
	

	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
		
	
	velocity.y -= 20.0 * delta
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = 10
	elif Input.is_action_just_released("jump") and velocity.y > 3:
		velocity.y = 3
	
	move_and_slide()
	
func _on_pause_menu_play():
	dot.visible = true


func _on_pause_menu_save() -> void:
	var y = rotation.y
	var x = %Camera3D.rotation.x
	emit_signal("save_pos",rotation.x, y, x, %Camera3D.rotation.y )
	pass # Replace with function body.


func _on_pause_menu_pause():
	dot.visible = false


func _on_dialogue_manager_pause() -> void:
	dot.visible = false


func _on_dialogue_manager_play() -> void:
	dot.visible = true
