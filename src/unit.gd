extends CharacterBody2D
class_name Unit

##Enemy Stats
@export var speed : float = 30.0
@onready var anim_player = get_node("AnimatedSprite2D")
var current_animation : String = "default"
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

##Sprite Travel and Location Data
var starting_position : Vector2 = Vector2()
@export var move_direction: Vector2 = Vector2()
var target_position : Vector2 = Vector2()

## Sets initial global position + defined
func _ready():
	starting_position = global_position
	target_position = starting_position + move_direction

func _physics_process(delta):
	## Alternates between starting position and Vector2 coordinate as destination
	velocity = position.direction_to(target_position) * speed
	var next_animation = "walk"
	if position.distance_to(target_position) <= 1:
		anim_player.flip_h = !anim_player.flip_h
		if position.distance_to(starting_position) <= 1:
			target_position = starting_position + move_direction
		else:
			target_position = starting_position
	move_and_slide()
	animation_handler(next_animation)

## Changes animation based off string
## TODO: Create Animation State Machine?
func animation_handler(animation_to_play : String):
	if current_animation == animation_to_play:
		return
	else:
		anim_player.stop()
		anim_player.play(animation_to_play)
		current_animation = animation_to_play
