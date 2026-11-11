extends CanvasLayer

@export var curser : TextureRect
var change : float = 1
var speed_change = .5
var change_limit = 2
var direction : bool = true
var cur_x = 0
var cur_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	cur_x = curser.position.x
	cur_y = curser.position.y
	print(str(curser.scale))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction:	change += speed_change * delta
	else:	change -= speed_change * delta
	if change >= change_limit:
		direction = false
	elif change <= 1:
		direction = true
	print(str(change))
	curser.scale.x = change
	curser.scale.y = change
