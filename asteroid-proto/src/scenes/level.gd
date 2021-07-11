extends Node2D
class_name Level

export var timer = 90
export var start = 0

# Declare member variables here. Examples:
var game_over = preload('game_over.tscn')

func _get_max_time():
	return timer

func _get_time_elapsed():
	return OS.get_unix_time() - start

# Called when the node enters the scene tree for the first time.
func _ready():
	start = OS.get_unix_time()

func _game_over(score):
	var game_over_screen = game_over.instance()
	game_over_screen.get_node('ScoreLabel').text += str(score)
	get_parent().add_child(game_over_screen)

func _process(delta):
	var elapsed = OS.get_unix_time() - start
	if(elapsed >= timer):
		if(get_node('Player')):
			get_node('Player')._die()


