extends Actor
class_name Player

# Declare member variables here. Examples:
var shoot_rock = preload('..//projectiles/BulletStone.tscn')
var shoot_life = preload('..//projectiles/BulletLife.tscn')
var rock_count = 10
var life_count = 10
export var projectile_speed = 500
var score = 0
export var interpolation_fac = .1

func _get_rock_count() -> int:
	return rock_count
	
func _get_life_count() -> int:
	return life_count
	
func set_life_count(n: int):
	life_count = n 
func set_rock_count(n: int):
	rock_count = n
	
func _get_score() -> int:
	return score
	
func _update_score(value: int) -> void:
	score += value
	if (value > 0):
		get_node("score+").play()
	elif (value < 0):
		get_node("score-").play()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group('Player')


func _reset_life():
	if (life_count < 10):
		get_node("bubbles").play()
	life_count = 10
func _add_rock(nb_of_rock):
	get_node("rock_grab").play()
	rock_count += nb_of_rock

func _process(_delta):
	# Handling death and appearance
	if not rock_count:
		emit_signal('die')
	elif(rock_count <= 3):
		if (life_count == 0):
			get_node("Asteroid").play("brokenNL")
		else:
			get_node("Asteroid").play("broken")
	else:
		if (life_count == 0):
			get_node("Asteroid").play("defaultNL")
		else:
			get_node("Asteroid").play("default")
			
	# GPS handling
	var home = get_parent().get_node('Motherland')
	var dToHome = (home.position - position).normalized()
	var angle = acos(dToHome.x) * sign(dToHome.y)
	get_node('GPS').rotation = angle
	
	# set rotation
	var d = velocity.normalized()
	var asteroid = get_node("Asteroid")
	asteroid.rotation = interpolation_fac*(cos(d.x) * sign(d.y)) + (1-interpolation_fac)*asteroid.rotation
		
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
	var mousePos = get_global_mouse_position()
	var projection = velocity.dot((mousePos - position).normalized())
	
	if Input.is_action_just_pressed("shoot_rock") and rock_count:
		rock_count -= 1
		var shoot_instance = shoot_rock.instance()
		shoot_instance.position = get_global_position()
		shoot_instance.projectile_speed = projectile_speed
		shoot_instance.velocity = .5*projection * (mousePos - position).normalized()
		shoot_instance.rotation = get_angle_to(mousePos)
		get_parent().add_child(shoot_instance)
		get_node("AudioStreamPlayer3").play()
	if Input.is_action_just_pressed("shoot_life") and life_count:
		life_count -= 1
		var shoot_instance = shoot_life.instance()
		shoot_instance.position = get_global_position()
		shoot_instance.projectile_speed = projectile_speed
		shoot_instance.velocity = .5*projection * (mousePos - position).normalized()
		shoot_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(shoot_instance)

func _take_damage(n: int) -> void:
	rock_count = rock_count - n if (rock_count-n) > 0 else 0
	get_node("hit").play()
func _on_Player_die():
	print('Receive die signal')
	var keep_score = self.score
	queue_free()
	get_parent()._game_over(keep_score)
	
func _die():
	print("Sending die signal")
	emit_signal('die')

