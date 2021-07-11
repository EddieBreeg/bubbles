extends "res://src/actors/Enemy.gd"

class_name PoisonNova

# Declare member variables here. Examples:
export var speed = 1000 
var life_time = 3
var nova_velocity = Vector2(100,0)
var life_time_nova = 15


# Called when the node enters the scene tree for the first time.
func _ready():
	self_destruct()

func _physics_process(delta):
	move_and_collide((nova_velocity) * delta)

func self_destruct():
	yield(get_tree().create_timer(life_time_nova), "timeout")
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not hp:
		queue_free()


func _on_PoisonShape_body_entered(body):
	if((body.is_in_group("Player")) or (body.is_in_group("Planet"))):
		body._set_is_in_nova(true)

func _on_PoisonShape_body_exited(body):
	if((body.is_in_group("Player")) or (body.is_in_group("Planet"))):
		body._set_is_in_nova(false)
