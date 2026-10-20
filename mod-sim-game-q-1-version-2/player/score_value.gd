extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text("0")
	EventBus.picked_up.connect(add_score)
	EventBus.move_scene.connect(set_score)

func add_score(arg):
	var current = get_text()
	var value = int(current) + arg
	set_text(str(value))

func set_score(dict):
	if dict.has("score"):
		set_text(str(dict["score"]))
