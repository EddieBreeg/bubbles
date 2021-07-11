extends Actor
class_name Planet

var isAlive = false
export var rotationSpeed = .1

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group('Planet')

func _on_Planet_die():
	queue_free()
func _process(delta):
	if isAlive:
		rotation += delta * rotationSpeed

func _take_damage(n: int) -> void:
	var player = get_parent().get_node('Player')
	if(player):
		player._update_score(-n if hp < max_hp else 0)
		hp = hp - n if (hp-n)>0 else 0
		hp = hp if hp < max_hp else max_hp
		if not hp:
			emit_signal('die')
		elif(hp < max_hp):
			isAlive = false
			get_node("AnimatedSprite").play("default")
			get_node("AudioStreamPlayer2D").stop()
		else:
			if isAlive == false:
				get_node("AudioStreamPlayer").play()
			isAlive = true
			get_node("AnimatedSprite").play("life")
			get_node("AudioStreamPlayer2D").play()
			

