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


func _on_control_rentdue():
	self.hide()


func _on_rent_rentpay():
	self.show()


func _on_shop_button_pressed():
	self.hide()



func _on_close_pressed():
	await get_tree().create_timer(0.2).timeout
	self.show()


func _on_rentpay_pressed():
	self.show()
