extends TextureRect

@export var guy : Texture2D
@export var godot : Texture2D
@export var sad : Texture2D

@onready var emotes = {
	"guy" : guy,
	"godot" : godot,
	"sad" : sad
}

func set_emote(mood: String):
	if emotes.has(mood):
		texture = emotes[mood]
	pass
