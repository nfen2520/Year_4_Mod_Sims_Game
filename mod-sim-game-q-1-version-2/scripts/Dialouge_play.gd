extends Node3D
signal save(num: int)
signal on_dialogue
signal interact(char)
var inter = false
func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		inter = true
		emit_signal("interact", true)
	else:
		pass
func iwantdeath():
	emit_signal("on_dialogue")


func _on_area_3d_body_exited(body):
	if body.is_in_group("Player"):
		inter = false
		emit_signal("interact", false)


func _on_player_dialogue():
	if inter:
		emit_signal("on_dialogue")


func _on_save_load_save():
	emit_signal("save", 1)
