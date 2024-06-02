extends Node2D

signal rentpay

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_rentpay_pressed():
	self.hide()
	emit_signal("rentpay")


func _on_control_rentdue():
	self.show()
