extends Node2D

signal goofy

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("goofy")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
