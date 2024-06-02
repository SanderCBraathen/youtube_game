extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_control_able_to_monetize():
	self.show()
