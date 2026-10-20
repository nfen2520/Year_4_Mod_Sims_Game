extends Button




func _on_pressed():
	EventBus.test.emit("hello from the other side")
