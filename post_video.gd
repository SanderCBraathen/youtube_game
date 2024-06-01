extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	vid_countdown()


func vid_countdown():
	self.hide()


func _on_video_vid_posted():
	self.show()
