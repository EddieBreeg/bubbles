extends "res://src/actors/Actor.gd"
class_name Enemy


# Declare member variables here. Examples:
var shoot_rock = preload('..//projectiles/BulletStone.tscn')


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func shot_flame():
	var shoot_instance = shoot_rock.instance()
	shoot_instance.position = get_global_position()
	shoot_instance.velocity = velocity
	get_parent().add_child(shoot_instance)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	shot_flame()

func _on_Enemy_die():
	queue_free()
