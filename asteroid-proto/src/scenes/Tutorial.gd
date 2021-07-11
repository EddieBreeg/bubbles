extends Level

signal _how_to_heal
signal _how_to_kill

func _ready():
	_movements()


func _movements():
	print('arrow, DUH')
	yield(get_tree().create_timer(1.0), 'timeout')
	emit_signal("_how_to_heal")

func _how_to_heal():
	print('right click')
	yield(get_tree().create_timer(1.0), 'timeout')
	emit_signal('_how_to_kill')
	
func _how_to_kill():
	print('left click')
	yield(get_tree().create_timer(1.0), 'timeout')
	
