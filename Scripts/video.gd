extends Node2D

#Signals
signal vid_posted
signal random_sub_amount
signal view_amount
signal earnings
signal viral

#UI
@onready var title = $title
@onready var views = $views
@onready var revenue = $revenue/revenueamount
@onready var videos = $vidamount
@onready var monetize_sign = $monetize
@onready var popcount = $popcount

#variables
var videos_posted = 0
var amount_views = 0
var monetized = false
var subs = 0
var total_subs = 0
var popularity = 1

var g_mode = false
var n_mode = false

# Called when the node enters the scene tree for the first time.
func _ready():
	monetized = false
	title.text = "Title: "
	
	monetize_sign.add_theme_color_override("font_color", Color(0.596, 0, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if g_mode == true:
		popcount.text = "Prison Time: " + str(popularity) + "h"
	
	if n_mode == true:
		popcount.text = "Popularity: " + str(popularity)

func _on_post_video_pressed():
	new_vid()
	videos_posted += 1
	videos.text = "Video Number: " + str(videos_posted)


func new_vid():
	random_title()
	
	random_view_amount()
	if monetized == true:
		money_giving()
	await get_tree().create_timer(0.5).timeout
	_random_sub_amount()
	
	if amount_views >= 1000000000:
		views.text = str(amount_views / 1000000000) + "B"
	elif amount_views >= 1000000:
		views.text = str(amount_views / 100000) + "M"
	elif amount_views >= 10000:
		views.text = str(amount_views / 1000) + "K"
	else:
		views.text = str(amount_views)
	
	await get_tree().create_timer(0.5).timeout
	emit_signal("vid_posted")

func _random_sub_amount():
	var subper = 10
	if total_subs >= 1000:
		subper = 100
	subs = amount_views / subper
	total_subs += subs
	
	emit_signal("random_sub_amount", subs)

func random_view_amount():
	var viralgen = RandomNumberGenerator.new()
	var viralchance = viralgen.randi_range(1, 100)
	
	var popmin = popularity / 2
	var random_generator2 = RandomNumberGenerator.new()
	var randomnumber = random_generator2.randi_range(popmin, popularity)
	var max_view = total_subs * randomnumber
	var min_view = videos_posted / 2
	var random_generator = RandomNumberGenerator.new()
	var vid_view = random_generator.randi_range(min_view, max_view)
	amount_views = vid_view
	
	if viralchance == 1:
		var random_generator3 = RandomNumberGenerator.new()
		var viral_multi = random_generator3.randi_range(15, 500)
		amount_views = vid_view * viral_multi
		emit_signal("viral")
	else:
		pass
	
	emit_signal("view_amount", amount_views)


func random_title():
	var random_generator = RandomNumberGenerator.new()
	var random_number = random_generator.randi_range(1, 6)
	
	var random_text = 0
	
	if n_mode == true:
		if random_number == 1:
			random_text = "Playing the new game update!"
	
		if random_number == 2:
			random_text = "Cooking in this game right now!"
	
		if random_number == 3:
			random_text = "Im addicted to this game!"
	
		if random_number == 4:
			random_text = "Going outside!?"
	
		if random_number == 5:
			random_text = "New game new series?"
	
		if random_number == 6:
			random_text = "super vid guys!"
	
	if g_mode == true:
		if random_number == 1:
			random_text = "Slaying skibidis"
	
		if random_number == 2:
			random_text = "skibidi toilet review"
	
		if random_number == 3:
			random_text = "skibidi lore"
	
		if random_number == 4:
			random_text = "sigma lore"
	
		if random_number == 5:
			random_text = "looking at møllergata lore 2.0 for 20h"
	
		if random_number == 6:
			random_text = "ikea lore?"
	
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


func _on_toyuto_buy_pressed():
	popularity += 1


func _on_lambo_buy_pressed():
	popularity += 15


func _on_apartment_rent_pressed():
	popularity += 2


func _on_mansion_buy_pressed():
	popularity += 75


func _on_lowlex_buy_pressed():
	popularity += 2


func _on_banana_buy_pressed():
	popularity += 100


func _on_node_2d_goofy():
	g_mode = true


func _on_node_2d_normal():
	n_mode = true


func _on_control_esc():
	self.hide()


func _on_control_no():
	self.show()
