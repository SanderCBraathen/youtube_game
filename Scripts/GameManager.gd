extends Node2D

#enum State{
	#Play,
	#Building,
	#Destroying
#}
#
#var CurrentState = State.Play
#

var StartGameManager = false

var Wood = 2
var Stone := 0
var Food := 10
var Health := 100


#var Population : int = 0
#var MaxPopulation : int = 4
#var AlvPopulation : int = 0
#var Citizen : PackedScene
#var Happiness := 1
#var spawnReady := true
#var firePitSpaces : Array
#var occupiedFirePitSpaces : Array
var foodBool = true
#var TaxRate := 2


func _ready():
	pass



func _process(delta):
	if StartGameManager == true:
		if foodBool:
			foodBool = false
			await get_tree().create_timer(1.0).timeout
			Food -= 1
			if Food < 0:
				Food = 0
			foodBool = true
			if Food > 0:
				if Health < 100:
					Health += 1
			else:
				Health -= 5


func _on_tree_tree_cut_down():
	print("Tree cut down, adding wood")
	var random_generator = RandomNumberGenerator.new()
	var random_number = random_generator.randi_range(3, 12)
	Wood += random_number


func _on_player_start_gamemanager():
	StartGameManager = true
