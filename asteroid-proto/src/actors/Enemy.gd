extends "res://src/actors/Actor.gd"
class_name Enemy


# Declare member variables here. Examples:
var shoot_rock = preload('..//projectiles/EnemyBullet.tscn')

export (float) var rotation_speed = 0.5
var rotation_dir = 0

var rate_of_fire = 0.8
var can_fire = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func shot_flame():
	var shoot_instance = shoot_rock.instance()
	shoot_instance.projectile_speed = 500
	# Set spawn position
	shoot_instance.position = get_global_position() + get_node("Spawn").position.rotated(rotation)
	# Set angle of bulet on the same angle as the enemy
	shoot_instance.rotation = self.rotation
	# Display on screen
	get_parent().add_child(shoot_instance)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(can_fire):
		can_fire = false
		rotation += rotation_speed
		shot_flame()
		yield(get_tree().create_timer(rate_of_fire), 'timeout')
		can_fire = true
		

func _on_Enemy_die():
	queue_free()
