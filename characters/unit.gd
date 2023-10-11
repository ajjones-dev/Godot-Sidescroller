extends CharacterBody2D
class_name Unit

##Enemy Stats
@export var speed : float = 30.0
@onready var anim_player = get_node("AnimatedSprite2D")
var current_animation : String = "default"

##Sprite Travel and Location Data
var starting_position : Vector2 = Vector2()
@export var move_direction: Vector2 = Vector2()
var target_position : Vector2 = Vector2()

## Sets initial global position + defined
func _ready():
	starting_position = global_position
	target_position = starting_position + move_direction

func _process(delta):
	global_position = global_position.move_toward(target_position, speed * delta)
	var next_animation = "walk"
	if global_position == target_position:
		anim_player.flip_h = !anim_player.flip_h
		if global_position == starting_position:
			target_position = starting_position + move_direction
		else:
			target_position = starting_position
	animation_handler(next_animation)

func animation_handler(animation_to_play : String):
	if current_animation == animation_to_play:
		return
	else:
		anim_player.stop()
		anim_player.play(animation_to_play)
		current_animation = animation_to_play
