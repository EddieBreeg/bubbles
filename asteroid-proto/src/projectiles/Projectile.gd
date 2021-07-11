extends RigidBody2D

class_name Projectile

export var projectile_speed = 1000 
export var velocity = Vector2(1,0)
export var damage = 0

var life_time = 3

func _ready():
	velocity += projectile_speed*Vector2(1,0).rotated(rotation)
	apply_impulse(Vector2(), velocity)
	get_node("AnimatedSprite").play("default")
	self_destruct()

func self_destruct():
	yield(get_tree().create_timer(life_time), "timeout")
	get_node("AnimatedSprite").play("end")
	yield(get_tree().create_timer(0.5), "timeout")
	queue_free()
	
func _on_Projectile_body_entered(body: Node) -> void:
	get_node("Hitbox").set_deferred('disabled', true)
	self.hide()
	if((body.is_in_group("Planet")) or (body.is_in_group("Enemy"))):
		body._take_damage(-1)



