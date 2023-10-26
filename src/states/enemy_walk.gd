extends State
class_name EnemyWalk
## An extension on the [State] Class and a autonomos NPC Walk State
##
## Moves NPC CharacterBody2D between two points from the parent.
## Transitions between fall and idle states and handles animation walk
##

## Parent node for accessing position and velocity for movement
@export var parent : CharacterBody2D


## Called when the node enters the scene tree for the first time.
func enter():
	parent.starting_position = parent.global_position
	parent.target_position = parent.starting_position + parent.move_direction
	super()


## Called every frame. 'delta' is the elapsed time since the previous frame.
func update_physics(delta):
	parent.velocity = parent.position.direction_to(parent.target_position) * parent.speed
	
	# Fall detection. Switches to Fall State if not touching the floor.
	if not parent.is_on_floor():
		ChangeState.emit(self, "fall")
	
	# Wall detection. Resets target position if enemy hits wall.
	if parent.is_on_wall():
		if animation_player.flip_h:
			parent.target_position = parent.position + parent.move_direction
		else:
			parent.target_position = parent.position - parent.move_direction
	
	# Reached destination. Checks if target has reached destination and flips target.
	if parent.position.distance_to(parent.target_position) <= 1:
		if parent.position.distance_to(parent.starting_position) <= 1:
			parent.target_position = parent.starting_position + parent.move_direction
		else:
			parent.target_position = parent.starting_position
	
	# Direction detection. Orients sprite depending on motion.
	if parent.velocity.x >= 0:
		animation_player.flip_h = true
	else:
		animation_player.flip_h = false
	
	parent.move_and_slide()
