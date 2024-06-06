extends Node2D

signal rentpay

@onready var rent_amount_ui = $renttext/rentamount
var bill_amount = 120
var mansion_bought = false
var elbillmin = 50
var elbillmax = 200
var apartment_rent = false
var rent

# Called when the node enters the scene tree for the first time.
func _ready():
	bill_amount = 0
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
	
	if apartment_rent == false:
		bill_amount =+ 500
	
	if apartment_rent == true:
		bill_amount =+ 5000


func _on_rentpay_pressed():
	self.hide()
	emit_signal("rentpay", bill_amount)
	bill_amount = rent


func _on_control_rentdue():
	await get_tree().create_timer(2).timeout
	self.show()


func _on_shop_rent(rent_amount):
	apartment_rent = true


func _on_shop_mansion():
	mansion_bought = true
