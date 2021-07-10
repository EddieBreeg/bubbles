extends Projectile

class_name EnemyBullet


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Projectile_body_entered(body: Node) -> void:
	get_node("Hitbox").set_deferred('disabled', true)
	self.hide()
	if body.is_in_group("Player"):
		body._take_damage(1)
