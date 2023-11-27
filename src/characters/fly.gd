extends Area2D
class_name Fly

const SPEED : float = 90.0
var value : int = 5
var damage_timer : float = 0.0
var damage_speed : float = 2.0

## Scene Variables
var starting_position : Vector2 = Vector2()
@export var move_direction: Vector2 = Vector2()
var target_position : Vector2 = Vector2()

@onready var hurt_vector : RayCast2D = get_node("HurtVector")
@onready var _animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	starting_position = global_position
	target_position = starting_position + move_direction
	_animated_sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_position, SPEED * delta)
	
	if global_position == target_position:
		if global_position == starting_position:
			target_position = starting_position + move_direction
		else:
			target_position = starting_position


## Called when player hits enemy weak spot
func die(body):
	body.add_score(value)
	queue_free()


## Called when Enemy Spawner is used to instantiate instance of Mouse
func create(spawned_direction : Vector2) -> void:
	move_direction = spawned_direction
	starting_position = global_position


## Deletes enemy from memory if no longer visible
## Visible box much larger than mouse
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("player"):
		die(body)
