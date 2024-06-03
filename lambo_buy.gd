extends Button

var bought = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	self.hide()
	bought = true


func _on_control_over_1_4m():
	if bought == false:
		self.show()


func _on_control_under_1_4m():
	if bought == false:
		self.hide()
