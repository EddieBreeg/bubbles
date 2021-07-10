extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RestartButton_pressed():
	queue_free()
	for i in range(0, get_parent().get_child_count()):
		get_parent().get_child(i).queue_free()
	get_tree().reload_current_scene()
