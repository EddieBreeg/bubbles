extends Node2D


func _ready():
	var level = preload('res://src/scenes/level0.tscn')
	var levelInstance = level.instance()
	add_child(levelInstance)
