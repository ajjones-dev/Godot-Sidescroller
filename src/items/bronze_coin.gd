extends Area2D
class_name BronzeCoin

## Generic collectible object
##
## Area2D object, deletes self if Player entity enters collision node
##

## Score to add if collected
@export var value : int = 1

## Coin animation
var bob_height : float = 15.0
var bob_speed : float = 5.0
var timer : float = 0.0

@onready var start_y : float = global_position.y


## Moves coin through a slow bob between height and starting position
func _process(delta):
	timer += delta
	var d = (sin(timer * bob_speed) + 1) / 2
	global_position.y = start_y + (d * bob_height)


## If the body entered is the player or in the player group, call add score and delete.
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.add_score(value)
		queue_free()
