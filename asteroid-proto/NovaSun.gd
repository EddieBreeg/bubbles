extends Enemy
class_name NovaSun

var shoot_nova = preload('res://src/actors/PoisonNova.tscn')

export (float) var rotation_speed = 0.5
var rotation_dir = 0

var nova_speed = Vector2(200,200)

var rate_of_fire = 15
var can_fire = true


# Called when the node enters the scene tree for the first time.
#func _ready():
	
func shot_poison():
	var shoot_instance = shoot_nova.instance()
	var player_position = Vector2(0,0)
	if(get_parent().get_node("Player")):
		player_position = get_parent().get_node("Player").get_global_position()
	var shoot_direction = player_position - get_global_position() 
	shoot_instance.nova_velocity = shoot_direction.normalized() * nova_speed
	shoot_instance.position = get_global_position()
	# Display on screen
	get_parent().add_child(shoot_instance)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not hp:
		queue_free()
	if(can_fire):
		can_fire = false
		rotation += rotation_speed
		shot_poison()
		yield(get_tree().create_timer(rate_of_fire), 'timeout')
		can_fire = true
		
func _on_CollisionDetector_body_entered(body):
	print("Enter blackhole atmosphere")
	if(body.is_in_group("Player")):
		body._take_damage(1)

