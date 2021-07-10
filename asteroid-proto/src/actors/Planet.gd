extends Actor
class_name Planet


func _on_Planet_die():
	queue_free()
