extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_video_viral():
	self.show()


#func _on_post_video_pressed():
	#


func _on_video_vid_posted():
	await get_tree().create_timer(3).timeout
	self.hide()
