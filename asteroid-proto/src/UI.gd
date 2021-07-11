extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	var player = get_parent()
	var scene = get_parent().get_parent()
	
	var rocks = player._get_rock_count()
	get_node('RocksLabel').text = str(rocks)
	get_node('RocksLabel').set("custom_colors/font_color", Color(1,0,0) if rocks<=3 else Color(1,1,1))
	
	var lives = player._get_life_count()
	get_node('LivesLabel').text = str(lives)
	
	var score = player._get_score()
	get_node('ScoreLabel').text = "Score: " + str(score)
	
	var time_elapsed = scene._get_time_elapsed()
	var max_time = scene._get_max_time()
	var danger_time = max_time - 10
	get_node("TimeLabel").text = "Time: " + str(time_elapsed)
	get_node("TimeLabel").set("custom_colors/font_color", Color(1,0,0) if time_elapsed >= danger_time else Color(1,1,1))
