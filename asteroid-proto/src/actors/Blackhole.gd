extends Enemy
class_name Blackhole

export var mass = 100000
export var distance_scale = 7
export var max_distance = 900
var baseStrength = 0

func _ready():
	var player = get_parent().get_node('Player')
	player.add_force_source(self)
	baseStrength = mass * distance_scale * distance_scale

	
func _force_on(target: Actor) -> Vector2:
	var v = position - target.position
	var d = v.length()
	if d > max_distance:
		return Vector2.ZERO
	return v * (baseStrength/(d*d))
