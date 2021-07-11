extends Node2D

class_name level


# Declare member variables here. Examples:
var game_over = preload('game_over.tscn')


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _game_over(score):
	var game_over_screen = game_over.instance()
	game_over_screen.get_node('ScoreLabel').text += str(score)
	get_parent().add_child(game_over_screen)
