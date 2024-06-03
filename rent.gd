extends Node2D

signal rentpay

@onready var rent_amount_ui = $renttext/rentamount
var bill_amount = 120
var rent = 120
var mansion_bought = false
var elbillmin = 50
var elbillmax = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	var random_generator = RandomNumberGenerator.new()
	var electricity_bill = random_generator.randi_range(elbillmin, elbillmax)
	bill_amount += electricity_bill
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rent_amount_ui.text = str(bill_amount) + " $"
	if mansion_bought == true:
		rent = 0
		elbillmin = 300
		elbillmax = 750


func _on_rentpay_pressed():
	self.hide()
	emit_signal("rentpay", bill_amount)
	bill_amount = rent


func _on_control_rentdue():
	self.show()


func _on_shop_rent(rent_amount):
	rent = rent_amount


func _on_shop_mansion():
	mansion_bought = true
