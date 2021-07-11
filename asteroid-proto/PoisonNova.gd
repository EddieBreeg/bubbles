extends "res://src/actors/Enemy.gd"

class_name PoisonNova

# Declare member variables here. Examples:
export var speed = 1000 
var life_time = 3
var nova_velocity = Vector2(100,0)


# Called when the node enters the scene tree for the first time.
#func _ready():

func _physics_process(delta):
	move_and_collide((nova_velocity) * delta)


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass


func _on_PoisonShape_body_entered(body):
	if((body.is_in_group("Player")) or (body.is_in_group("Planet"))):
		body._set_is_in_nova(true)

func _on_PoisonShape_body_exited(body):
	if((body.is_in_group("Player")) or (body.is_in_group("Planet"))):
		body._set_is_in_nova(false)