extends Actor
class_name Planet

var isAlive = false
export var rotationSpeed = .1
var normal_planet_hp = 5

var planet_max_hp = 10
var planet_hp = 5

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
		planet_hp = planet_hp - n if (planet_hp-n)>0 else 0
		planet_hp = planet_hp if planet_hp < planet_max_hp else planet_max_hp
		if not planet_hp:
			emit_signal('die')
		elif((normal_planet_hp <= planet_hp) and (planet_hp < planet_max_hp)):
			get_node("AnimatedSprite").play("default")
		elif(planet_hp < normal_planet_hp):
			isAlive = false
			get_node("AnimatedSprite").play("broken")
			get_node("AudioStreamPlayer2D").stop()
		else:
			if isAlive == false:
				get_node("AudioStreamPlayer").play()
			isAlive = true
			get_node("AnimatedSprite").play("life")
			get_node("AudioStreamPlayer2D").play()
			

