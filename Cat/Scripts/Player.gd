extends Area2D

export var speed = 100

var projectile_scene  = preload("res://Scenes/Projectile.tscn")

var directions = {
	KEY_UP: Vector2(0,1),
	KEY_DOWN: Vector2(0,-1),
	KEY_RIGHT: Vector2(1,0),
	KEY_LEFT: Vector2(-1,0)
}

func _process(_delta):
	var d = (get_global_mouse_position() - position).normalized()
	var angle = acos(d.x) * sign(d.y) 
	var spwn = get_node("ProjectileSpawn")
	rotation = angle
	if Input.is_action_just_pressed("shoot"):
		var instance = projectile_scene.instance()
		instance.position = position + spwn.position.rotated(angle)
		instance.rotation = angle

		get_parent().add_child(instance)

