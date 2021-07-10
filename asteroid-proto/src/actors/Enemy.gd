extends "res://src/actors/Actor.gd"
class_name Enemy

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_BulletDetector_body_entered(body):
	_take_damage(1)

	

func _take_damage(n: int) -> void:
	hp -= n

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:

