extends CanvasLayer
class_name Text_Display

@onready var timer = $Timer
@onready var label = $Control/VBoxContainer/Label
@onready var me = self
@onready var c = ""

func _ready():
	EventBus.Top_Text.connect(temp_display)
	pass

func display(arg: String) -> void:
	label.text = arg
func stop() -> void:
	clear()

func temp_display(text: String, time : int):
	label.text = text
	timer.start(time)
	
func clear():
	label.text = c
	timer.stop()

func _on_timer_timeout():
	clear()
