extends Control

@onready var save_but = $VBoxContainer/save

signal esc
signal no

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		self.show()
		emit_signal("esc")


func _on_yes_pressed():
	change_scene("res://Scenes/main_menu.tscn")


func change_scene(target: String) -> void:
	get_tree().change_scene_to_file(target)


func _on_no_pressed():
	self.hide()
	emit_signal("no")


func _on_save_pressed():
	save_but.add_theme_color_override("font_color", Color(0,1,0))
	save_but.text = "Game Saved!"
