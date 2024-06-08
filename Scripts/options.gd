extends Control

@onready var CM = $VBoxContainer/goofy_mode

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	change_scene("res://Scenes/main_menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_goofy_mode_toggled(toggled_on):
	CM.add_theme_color_override("font_color", Color(0,1,0))

func change_scene(target: String) -> void:
	get_tree().change_scene_to_file(target)
