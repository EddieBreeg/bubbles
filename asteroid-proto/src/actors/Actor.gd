extends KinematicBody2D
class_name Actor


# Declare member variables here. Examples:
var moving_speed = 600
var velocity: = Vector2(0, 0)
var hp = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_BulletDetector_body_entered(body):
	_take_damage(1)


func _take_damage(n: int) -> void:
	hp -= n

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(hp <= 0):
		queue_free()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
