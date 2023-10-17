extends State
class_name EnemyWalk

@export var parent : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func enter():
	parent.starting_position = parent.global_position
	parent.target_position = parent.starting_position + parent.move_direction
	super()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_physics(delta):
	parent.velocity = parent.position.direction_to(parent.target_position) * parent.speed
	
	if parent.position.distance_to(parent.target_position) <= 1:
		animation_player.flip_h = !animation_player.flip_h
		if parent.position.distance_to(parent.starting_position) <= 1:
			parent.target_position = parent.starting_position + parent.move_direction
		else:
			parent.target_position = parent.starting_position
	parent.move_and_slide()
