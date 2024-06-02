extends Control

#UI
@onready var subs_ui = $Control/Subs/subvalue
@onready var money_ui = $Control/VBoxContainer/Money/MoneyAmount
@onready var total_views = $Control/Views/viewamount
@onready var total_vids = $Control/vids/vidamount
@onready var channelmon = $"../channelmon"
@onready var monetize_status = $"../monetizestatus"
@onready var total_earnings = $Control/earnings/earningamount
@onready var payduedate = $Control/daycount/dayamount

#Variables
var monetized = false
var money = 1000
var subscribers = 0
var views = 0
var vids = 0
var earnings = 0
var payduedate_amount = 0

#Signals
signal over_1000_subs
signal able_to_monetize
signal rentdue


# Called when the node enters the scene tree for the first time.
func _ready():
	monetize_status.add_theme_color_override("font_color", Color(0.788, 0, 0))
	monetize_status.text = "Not Monetized"
	payduedate_amount = 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	total_vids.text = str(vids)
	total_views.text = str(views)
	subs_ui.text = str(subscribers)
	money_ui.text = str(money) + " $"
	total_earnings.text = str(earnings) + " $"
	payduedate.text = str(payduedate_amount)
	
	if payduedate_amount == 0:
		emit_signal("rentdue")
	
	if subscribers >= 1000:
		emit_signal("over_1000_subs")
	
	if subscribers >= 1000:
		emit_signal("able_to_monetize")
		var able_to_monetize = true


func _on_post_video_pressed():
	vids += 1
	payduedate_amount -= 1


func _on_video_random_sub_amount(subs):
	subscribers += subs


func _on_video_view_amount(amount_views):
	await get_tree().create_timer(1).timeout
	views += amount_views



func _on_monetize_pressed():
	monetized = true
	
	monetize_status.add_theme_color_override("font_color", Color(0, 0.537, 0))
	monetize_status.text = "Monetized"


func _on_video_earnings(money_earnings):
	money += money_earnings
	earnings += money_earnings


func _on_rent_rentpay():
	money -= 120
	payduedate_amount += 30
