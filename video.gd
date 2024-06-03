extends Node2D

#Signals
signal vid_posted
signal random_sub_amount
signal view_amount
signal earnings

#UI
@onready var title = $title
@onready var views = $views
@onready var revenue = $revenue/revenueamount
@onready var videos = $vidamount
@onready var monetize_sign = $monetize

#variables
var videos_posted = 0
var amount_views = 0
var monetized = false
var subs = 0
var total_subs = 0
var popularity = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	monetized = false
	title.text = "Title: "
	
	monetize_sign.add_theme_color_override("font_color", Color(0.596, 0, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_post_video_pressed():
	new_vid()
	videos_posted += 1
	videos.text = "Video Number: " + str(videos_posted)


func new_vid():
	random_title()
	
	random_view_amount()
	if monetized == true:
		money_giving()
	await get_tree().create_timer(1).timeout
	_random_sub_amount()
	
	views.text = "Views: " + str(amount_views)
	
	await get_tree().create_timer(2).timeout
	emit_signal("vid_posted")

func _random_sub_amount():
	var subper = 10
	if total_subs >= 1000:
		subper = 250
	subs = amount_views / subper
	total_subs += subs
	
	emit_signal("random_sub_amount", subs)

func random_view_amount():
	var random_generator2 = RandomNumberGenerator.new()
	var randomnumber = random_generator2.randi_range(1, popularity)
	var max_view = total_subs * randomnumber
	var min_view = videos_posted / 2
	var random_generator = RandomNumberGenerator.new()
	var vid_view = random_generator.randi_range(min_view, max_view)
	amount_views = vid_view
	
	emit_signal("view_amount", amount_views)


func random_title():
	var random_generator = RandomNumberGenerator.new()
	var random_number = random_generator.randi_range(1, 6)
	
	var random_text = 0
	
	if random_number == 1:
		random_text = "sigma video"
	
	if random_number == 2:
		random_text = "i play games"
	
	if random_number == 3:
		random_text = "i am mrbist"
	
	if random_number == 4:
		random_text = "skibidi toilet review"
	
	if random_number == 5:
		random_text = "don't bother trying again"
	
	if random_number == 6:
		random_text = "to good for you"
	
	title.text = "Title: " + random_text


func _on_control_over_1000_subs():
	pass # Replace with function body.


func _on_monetize_pressed():
	monetized = true
	
	monetize_sign.add_theme_color_override("font_color", Color(0, 0.769, 0))
	

func money_giving():
	var money_earnings = amount_views / 1000
	await get_tree().create_timer(0.5).timeout
	revenue.text = str(money_earnings) + " $"
	
	emit_signal("earnings", money_earnings)
