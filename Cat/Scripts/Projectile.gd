extends RigidBody2D


export var speed = 500
export var damage_value = 1


func _ready():
	apply_impulse(position, speed*Vector2(1,0).rotated(rotation))
