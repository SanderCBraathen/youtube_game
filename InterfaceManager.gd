extends Control

#UI
@onready var subs_ui = $Control/Subs/subvalue
@onready var money_ui = $Control/VBoxContainer/Money/MoneyAmount
@onready var total_views = $Control/Views/viewamount
@onready var total_vids = $Control/vids/vidamount
@onready var channelmon = $channelmon
@onready var monetize_status = $monetizestatus
@onready var total_earnings = $Control/earnings/earningamount
@onready var payduedate = $Control/daycount/dayamount

#Variables
var monetized = false
var money = 15000
var subscribers = 0
var views = 0
var vids = 0
var earnings = 0
var payduedate_amount = 0

#Signals
signal over_1000_subs
signal able_to_monetize
signal rentdue
signal money_amount

signal over_2300
signal over_25k
signal over_1_4m
signal over_187_5m
signal over_250m

signal under_2300
signal under_25k
signal under_1_4m
signal under_187_5m
signal under_250m

signal bankrupt

# Called when the node enters the scene tree for the first time.
func _ready():
	monetize_status.add_theme_color_override("font_color", Color(0.788, 0, 0))
	monetize_status.text = "Not Monetized"
	payduedate_amount = 30

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	total_vids.text = str(vids)
	if views >= 1000000:
		total_views.text = str(views / 100000) + "M"
	elif views >= 10000:
		total_views.text = str(views / 1000) + "K"
	else:
		total_views.text = str(views)
	
	if subscribers >= 1000000:
		subs_ui.text = str(subscribers / 100000) + "M"
	elif subscribers >= 10000:
		subs_ui.text = str(subscribers / 1000) + "K"
	else:
		subs_ui.text = str(subscribers)
	
	if money >= 1000000:
		money_ui.text = str(money / 100000) + "M" + " $"
	elif money >= 10000:
		money_ui.text = str(money / 1000) + "K" + " $"
	else:
		money_ui.text = str(money) + " $"
	total_earnings.text = str(earnings) + " $"
	payduedate.text = str(payduedate_amount)
	
	if money <= 0:
		emit_signal("bankrupt")
		change_scene("res://bankrupt.tscn")
	
	emit_signal("money_amount", money)
	
	if payduedate_amount == 0:
		emit_signal("rentdue")
	
	if subscribers >= 1000:
		emit_signal("over_1000_subs")
	
	if subscribers >= 1000:
		emit_signal("able_to_monetize")
		var able_to_monetize = true
	
	if money >= 2300:
		emit_signal("over_2300")
	if money >= 25000:
		emit_signal("over_25k")
	if money >= 1400000:
		emit_signal("over_1_4m")
	if money >= 187500000:
		emit_signal("over_187_5m")
	if money >= 250000000:
		emit_signal("over_250m")
	
	if money <= 2299:
		emit_signal("under_2300")
	if money <= 24999:
		emit_signal("under_25k")
	if money <= 1399999:
		emit_signal("under_1_4m")
	if money <= 187499999:
		emit_signal("under_187_5m")
	if money <= 249999999:
		emit_signal("under_250m")


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


func _on_rent_rentpay(bill_amount):
	money -= bill_amount
	payduedate_amount += 30


func _on_shop_bought(bought_amount):
	money -= bought_amount

func change_scene(target: String) -> void:
	get_tree().change_scene_to_file(target)

#func _on_shop_rent(rent_amount):
	#rent = rent_amount
