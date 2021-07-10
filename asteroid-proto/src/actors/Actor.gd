extends KinematicBody2D
class_name Actor

signal die

# Declare member variables here. Examples:
var moving_speed = 600
var velocity: = Vector2(0, 0)
var hp = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _take_damage(n: int) -> void:
	print(n)
	hp = hp - n if (hp-n)>0 else 0
	if not hp:
		emit_signal('die')


func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta)
