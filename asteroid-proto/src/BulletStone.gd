extends RigidBody2D


# Declare member variables here. Examples:
var projectile_speed = 400


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(), Vector2(projectile_speed,0).rotated(rotation))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
