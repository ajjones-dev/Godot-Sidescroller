extends State
class_name PlayerJump

## An extension on the [State] Class and a Player Jump State
##
## Will repeat if double_jump has not been used
## Transitions to:
## fall, walk
##

## Link to parent node for accessing properties
@export var parent : CharacterBody2D


## _ready() adds to jump counter and increases y velocity
func enter():
	parent.velocity.y -= parent.JUMP_VELOCITY
	parent.jump_count += 1
	
	super()


## _physics_process(delta) Adds velocity to y and processes double jump
func update_physics(delta : float):
	# Slows down y velocity by gravity
	parent.velocity.y += gravity * delta
	
	# Once velocity is no longer moving upward, switch to fall
	if parent.velocity.y > 0:
		ChangeState.emit(self, "fall")
	
	# Check if player is trying to in-air control
	var direction = Input.get_axis("left", "right")
	if direction:
		parent.velocity.x = direction * parent.SPEED
	
	# Detects facing direction for sprite flip
	if direction < 0:
		animation_player.flip_h = true
	elif direction > 0:
		animation_player.flip_h = false
	
	# Double Jump, if hasn't double jumped then apply half velocity
	if Input.is_action_just_pressed("jump") and parent.jump_count <= parent.MAX_JUMP and not parent.has_double_jumped and not parent.is_on_floor():
		parent.jump_count += 1
		parent.velocity.y = -parent.JUMP_VELOCITY / 2
		parent.has_double_jumped = true
		
	parent.move_and_slide()
