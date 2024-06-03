extends Node2D

#Nodes
@onready var toy_label_ui = $categories/cars/Toyuto_label
@onready var lambo_label_ui = $categories/cars/lambo_label

@onready var apartment_label_ui = $categories/house/apartment_label
@onready var mansion_label_ui = $categories/house/mansion_label

@onready var lowlex_label_ui = $categories/luxury/lowlex_label
@onready var banana_label_ui = $categories/luxury/banana_label


#Signals
signal bought
signal rent
signal mansion

#Variables
var bought_amount
var rent_amount
var mansion_bought = false
var money_amount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()
	bought_amount = 0
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mansion_bought == true:
		apartment_label_ui.text = "House Bought"
		apartment_label_ui.add_theme_color_override("font_color", Color(1,0,0))

func _on_shop_pressed():
	self.show()


func _on_close_pressed():
	self.hide()


#Cars
func _on_toyuto_buy_pressed():
	bought_amount = 2300
	emit_signal("bought", bought_amount)
	toy_label_ui.add_theme_color_override("font_color", Color(0,1,0))
	toy_label_ui.text = "Bought"

func _on_lambo_buy_pressed():
	bought_amount = 1400000
	emit_signal("bought", bought_amount)
	lambo_label_ui.add_theme_color_override("font_color", Color(0,1,0))
	lambo_label_ui.text = "Bought"


#Houses
func _on_apartment_rent_pressed():
	rent_amount = 5000
	emit_signal("rent", rent_amount)
	apartment_label_ui.add_theme_color_override("font_color", Color(0,1,0))
	apartment_label_ui.text = "Rented"

func _on_mansion_buy_pressed():
	bought_amount = 187500000
	emit_signal("bought", bought_amount)
	emit_signal("mansion")
	mansion_label_ui.add_theme_color_override("font_color", Color(0,1,0))
	mansion_label_ui.text = "Bought"
	mansion_bought = true


#Luxury
func _on_lowlex_buy_pressed():
	bought_amount = 25000
	emit_signal("bought", bought_amount)
	lowlex_label_ui.add_theme_color_override("font_color", Color(0,1,0))
	lowlex_label_ui.text = "Bought"

func _on_banana_buy_pressed():
	bought_amount = 250000000
	emit_signal("bought", bought_amount)
	banana_label_ui.add_theme_color_override("font_color", Color(0,1,0))
	banana_label_ui.text = "Bought"


#func _on_control_money_amount(money):
	#money_amount = money
