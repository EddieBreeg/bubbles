extends Actor
class_name Enemy


# Declare member variables here. Examples:

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group('Enemy')

func _on_Enemy_die():
	queue_free()

func _on_CollisionsDetector_body_entered(body):
	if(body.is_in_group("Player")):
		body._take_damage(1)
		
