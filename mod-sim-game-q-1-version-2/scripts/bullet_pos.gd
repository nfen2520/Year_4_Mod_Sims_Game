extends CharacterBody3D


const SPEED = 50

func _ready():
	var timer = Timer.new()
	timer.timeout.connect(self.queue_free)
	timer.autostart = true
	add_child(timer)

func _process(delta):
	position += transform.basis * Vector3(0,0,-SPEED) * delta
