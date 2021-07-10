extends Sprite

export var pulse_rate = .3
export var base_opacity = .5
export var amplitude = .2
var t = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t  = fmod(t + delta, 20*PI)
	var op = amplitude*sin(2*PI*pulse_rate*t) + base_opacity
	modulate.a = op
