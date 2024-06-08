extends Label

var monetized = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_control_over_1000_subs():
	if monetized == false:
		self.show()
		await get_tree().create_timer(4).timeout
		self.hide()
	else:
		self.hide()


func _on_monetize_pressed():
	self.hide()
	monetized = true
	
