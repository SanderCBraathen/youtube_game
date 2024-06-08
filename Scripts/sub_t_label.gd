extends Label

var got_sub = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_control_first_sub():
	if got_sub == false:
		self.show()
		await get_tree().create_timer(7).timeout
		self.hide()
		got_sub = true
	else:
		self.hide()

