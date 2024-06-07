extends Button

var in_shop = false
var bill_popup = false

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
	if in_shop == true or bill_popup == true:
		self.hide()
	else:
		self.show()


func _on_control_rentdue():
	bill_popup = true
	self.hide()


func _on_rent_rentpay():
	bill_popup = false
	self.show()


func _on_shop_button_pressed():
	in_shop = true
	self.hide()



func _on_close_pressed():
	await get_tree().create_timer(0.2).timeout
	self.show()
	in_shop = false


func _on_rentpay_pressed():
	self.show()
	bill_popup = false


func _on_control_rent_payed():
	if bill_popup == false:
		self.show()
