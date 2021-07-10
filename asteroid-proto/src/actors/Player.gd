extends Actor
class_name Player

# Declare member variables here. Examples:
var shoot_rock = preload('..//projectiles/BulletStone.tscn')
var shoot_life = preload('..//projectiles/BulletLife.tscn')
var rock_count = 10
var life_count = 10

func _get_rock_count() -> int:
	return rock_count
func _get_life_count() -> int:
	return life_count

func _physics_process(_delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= moving_speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += moving_speed
		
	if Input.is_action_pressed("ui_up"):
		velocity.y -= moving_speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += moving_speed
		
	if Input.is_action_just_pressed("shoot_rock") and rock_count:
		rock_count -= 1
		var shoot_instance = shoot_rock.instance()
		shoot_instance.position = get_global_position()
		shoot_instance.velocity = velocity
		shoot_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(shoot_instance)
	if Input.is_action_just_pressed("shoot_life") and life_count:
		life_count -= 1
		var shoot_instance = shoot_life.instance()
		shoot_instance.position = get_global_position()
		shoot_instance.velocity = velocity
		shoot_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(shoot_instance)

# func _take_damage(n: int) -> void:
# 	pass


func _on_Player_die():
	queue_free()
