extends Button

var possible_to_buy = true
var bought = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if possible_to_buy == false:
		#self.show()
	#else:
		#self.hide()


func _on_pressed():
	self.hide()
	bought = true


#func _on_shop_over_2300():
	#possible_to_buy = false


func _on_control_over_2300():
	if bought == false:
		self.show()


func _on_control_under_2300():
	if bought == false:
		self.hide()
