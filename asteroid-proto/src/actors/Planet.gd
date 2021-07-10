extends Actor
class_name Planet

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group('Planet')

func _on_Planet_die():
	queue_free()
