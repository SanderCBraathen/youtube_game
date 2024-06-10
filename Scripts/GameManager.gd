extends Node

var save_path = "user://mode.save"

var g_mode_unlock = false

func _on_banana_buy_pressed():
	g_mode_unlock = true

func _process(delta):
	


func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)

func _on_save_pressed():
	pass
