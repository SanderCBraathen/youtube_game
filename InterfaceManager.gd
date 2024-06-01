extends Control

#UI
@onready var subs_ui = $Control/Subs/subvalue
@onready var money_ui = $Control/VBoxContainer/Money/MoneyAmount
@onready var total_views = $Control/Views/viewamount
@onready var total_vids = $Control/vids/vidamount

#Variables
var money = 100
var subs = 0
var views = 0
var vids = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	total_vids.text = str(vids)
	total_views.text = str(views)
	subs_ui.text = str(subs)
	money_ui.text = str(money) + " $"
	



func _on_post_video_pressed():
	vids += 1
