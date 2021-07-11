extends KinematicBody2D


export var rotationSpeed = .1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += delta * rotationSpeed



func _on_PickItems_body_shape_entered(body_id, body, body_shape, local_shape):
	if(body.is_in_group("Player")):
		body._add_rock(3)
		self.queue_free()
