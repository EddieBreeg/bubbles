extends RigidBody2D

class_name Projectile

export var projectile_speed = 1000 # we should add the current velocity of the player somehow
export var velocity = Vector2(1,0)
export var damage = 0

signal hit


# Declare member variables here. Examples:
var life_time = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity += projectile_speed*Vector2(1,0).rotated(rotation)
	apply_impulse(Vector2(), velocity)
	self_destruct()

func self_destruct():
	yield(get_tree().create_timer(life_time), "timeout")
	queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Projectile_body_entered(body: Node) -> void:
	self.hide()
	if body.is_in_group("EnemyGroup"):
		print("Hit an enemy")
	emit_signal('hit')
	
# func _on_BulletStone_body_entered(body: Node) -> void:
# 	self.hide()
# 	if body.is_in_group("EnemyGroup"):
# 		print("Hit an enemy")
# 	emit_signal('hit')

