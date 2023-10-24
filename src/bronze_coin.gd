extends Area2D
class_name BronzeCoin

@export var value : int = 1
var bob_height : float = 5.0
var bob_speed : float = 5.0

@onready var start_y : float = global_position.y
var timer : float = 0.0

func _ready():
	pass

func _process(delta):
	timer += delta
	var d = (sin(timer * bob_speed) + 1) / 2
	global_position.y = start_y + (d * bob_height)

func _on_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
