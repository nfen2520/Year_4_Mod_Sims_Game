extends Area3D

var dead : bool = false
@export var value : int = 1

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		EventBus.death.emit(self.name, false)
		EventBus.picked_up.emit(value)
		self.queue_free()
