extends KinematicBody2D
class_name Actor


# Declare member variables here. Examples:
var moving_speed = 600
var velocity: = Vector2(0, 0)
var hp = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(hp <= 0):
		queue_free()

func _physics_process(delta: float) -> void:
	move_and_slide(velocity)
	
