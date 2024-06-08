extends Control

var normal_mode = false
var goofy_mode = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_normal_pressed():
	normal_mode = true
	goofy_mode = false
	change_scene("res://Scenes/n_main.tscn")

func change_scene(target: String) -> void:
	get_tree().change_scene_to_file(target)

func _on_goofy_pressed():
	goofy_mode = true
	normal_mode = false
	change_scene("res://Scenes/g_main.tscn")
