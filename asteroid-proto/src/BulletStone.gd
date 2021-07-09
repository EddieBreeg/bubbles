extends RigidBody2D


# Declare member variables here. Examples:
export var projectile_speed = 1000 # we should add the current velocity of the player somehow
var life_time = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(), Vector2(projectile_speed,0).rotated(rotation))
	self_destruct()

func self_destruct():
	yield(get_tree().create_timer(life_time), "timeout")
	queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_BulletStone_body_entered(body: Node) -> void:
	self.hide()
