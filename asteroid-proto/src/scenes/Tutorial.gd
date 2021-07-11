extends Level

signal _how_to_heal
signal _how_to_kill
signal _how_to_recharge_lives

var current = 0
var player = null
var textLabel = null
var events = ["_movements", "_how_to_heal", "_how_to_recharge_lives",
"_how_to_kill"]

func _ready():
	player = get_node('Player')
	player.set_life_count(5)
	textLabel = get_node('Player/TutoLabel')
	_movements()

func _next():
	if current >= events.size() -1:
		return
	current += 1
	emit_signal(events[current])

func _movements():
	textLabel.text = "To move: WASD/ZQSD"


func _how_to_heal():
	textLabel.text = "Heal the dead planet with\nright click"

func _how_to_recharge_lives():
	textLabel.text = "To recharge your lives, go back to\nthe Mother Land"

func _how_to_kill():
	textLabel.text = "To shoot a rock:\nRight Click\nDon't kill planets, though"

func _input(event):
	if Input.is_action_just_pressed("ui_focus_next"):
		_next()
