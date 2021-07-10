extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	var player = get_parent()
	var rocks = player._get_rock_count()
	get_node('RocksLabel').text = str(rocks)
	var lives = player._get_life_count()
	get_node('LivesLabel').text = str(lives)
	var score = player._get_score()
	get_node('ScoreLabel').text = "Score: " + str(score)
