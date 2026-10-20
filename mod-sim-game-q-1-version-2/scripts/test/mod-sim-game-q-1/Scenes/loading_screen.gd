extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("root/Game/Portal").portal.connect(wait)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func wait():
	
	print("Hello")
	
	pass


func _on_timer_timeout():
	set_visible(true)
	pass # Replace with function body.
