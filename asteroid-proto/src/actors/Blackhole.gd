extends Enemy
class_name Blackhole

export var distance_scale = 7
export var max_distance = 900
var baseStrength = 0

export var rotation_speed = .2

func _ready():
	self.add_to_group('Blackhole')
	var player = get_parent().get_node('Player')
	player.add_force_source(self)
	baseStrength = mass * distance_scale * distance_scale

func _process(delta):
	rotation += delta * rotation_speed
	
func _force_on(target: PhysicsBody2D) -> Vector2:
	var v = position - target.position
	var d = v.length()
	if d > max_distance:
		return Vector2.ZERO
	return v * (target.mass*baseStrength/(d*d))
