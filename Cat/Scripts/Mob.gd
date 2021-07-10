extends Area2D

export var life = 5
var is_alive = true

func take_damage(value):
	life = (life-value) if (life-value > 0) else 0
	is_alive = bool(life)
