extends KinematicBody2D
class_name Actor

signal die

# Declare member variables here. Examples:
var moving_speed = 600
var velocity: = Vector2(1, 0)
var hp = 3
export var mass = 100
export var max_hp = 8
var force_sources = []

# Variable for nova
var is_in_nova = false
var take_damage = true
var rate_of_damage = 2.5

# Getter and setter for nova
func _is_in_nova():
	return is_in_nova
	
func _set_is_in_nova(variable):
	is_in_nova = variable


func add_force_source(src: Actor):
	force_sources.append(src)

func _force_on(target: PhysicsBody2D) -> Vector2:
	return Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group('Actor')
	pass # Replace with function body.


func _take_damage(n: int) -> void:
	print(n)
	hp = hp - n if (hp-n)>0 else 0
	hp = hp if hp < max_hp else max_hp
	if not hp:
		emit_signal('die')

func _physics_process(delta: float) -> void:
	var global_force = Vector2.ZERO
	for src in force_sources:
		global_force += src._force_on(self)
	move_and_collide((velocity + global_force) * delta)
	
func _process(delta):
	# Give damage to actor from a nova
	if(is_in_nova):
		if(take_damage):
			take_damage = false
			_take_damage(1)
			yield(get_tree().create_timer(rate_of_damage), 'timeout')
			take_damage = true
