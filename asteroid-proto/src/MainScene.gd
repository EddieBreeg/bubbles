extends Node2D
class_name MainsScene

var menu = preload("res://src/MainMenu.tscn").instance()
var level = null

func _ready():
	add_child(menu)

func _load_menu():
	if level:
		remove_child(level)
		level = null
	add_child(menu)

func _load_level():
	level = preload("res://src/scenes/level0.tscn").instance()
	remove_child(menu)
	add_child(level)
	
func _load_tutorial():
	level = preload("res://src/scenes/tutorial.tscn").instance()
	remove_child(menu)
	add_child(level)
