extends Node2D

#Signals
signal vid_posted

#UI
@onready var title = $title
@onready var views = $views
@onready var revenue = $revenue

#variables
var videos_posted = 0

var amount_views = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_post_video_pressed():
	new_vid()
	videos_posted += 1


func new_vid():
	random_title()
	
	random_view_amount()
	
	views.text = "Views: " + str(amount_views)
	
	await get_tree().create_timer(3).timeout
	emit_signal("vid_posted")

func random_view_amount():
	if videos_posted == 1 or videos_posted == 2 or videos_posted == 3:
		var random_generator = RandomNumberGenerator.new()
		var vid_view = random_generator.randi_range(1, 35)
		amount_views = vid_view
	
	if videos_posted == 5:
		var random_generator = RandomNumberGenerator.new()
		var vid_view = random_generator.randi_range(3, 4)
		amount_views = vid_view


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
