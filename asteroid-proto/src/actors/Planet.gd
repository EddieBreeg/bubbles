extends Actor
class_name Planet


func _on_Planet_die():
	queue_free()

func _take_damage(n: int) -> void:
	var player = get_parent().get_node('Player')
	player._update_score(-n)
	hp = hp - n if (hp-n)>0 else 0
	hp = hp if hp < max_hp else max_hp
	if not hp:
		emit_signal('die')
