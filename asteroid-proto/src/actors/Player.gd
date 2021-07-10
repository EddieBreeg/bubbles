extends Actor
class_name Player

# Declare member variables here. Examples:
var shoot_rock = preload('..//projectiles/BulletStone.tscn')
var rock_count = 10
var life_count = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta: float) -> void:
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


