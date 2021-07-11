extends Node2D



func _on_TutorialButton_pressed():
	get_parent()._load_tutorial()


func _on_PlayButton_pressed():
	get_parent()._load_level()
