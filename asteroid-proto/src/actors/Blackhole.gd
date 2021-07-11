extends Enemy
class_name Blackhole


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _attract_player():
	var player = get_parent().get_node("Player")
	
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	_attractPlayer()
	
