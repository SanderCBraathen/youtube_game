extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_button_pressed():
	change_scene("res://main_menu.tscn")


func change_scene(target: String) -> void:
	get_tree().change_scene_to_file(target)


