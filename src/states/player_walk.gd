extends State
class_name PlayerWalk

## An extension on the [State] Class and a Player Walk State
##
## Turns off animation when no input is detected and player is on surface
## Transitions to:
## fall, idle, jump, and slide
##

## Link to parent node for accessing properties
@export var parent : CharacterBody2D


## _ready(). Resets jump counter if on floor
func enter():
	if parent.is_on_floor():
		parent.jump_count = 0
		parent.has_double_jumped = false
	
	super()


## _physics_process(delta)
func update_physics(_delta : float):
	parent.velocity.x = 0
	
	# Floor detection to change to fall state
	if not parent.is_on_floor():
		parent.jump_count += 1
		ChangeState.emit(self, "fall")

	# Get normalized axis for direction movement
	var direction = Input.get_axis("left", "right")
	if direction:
		parent.velocity.x = direction * parent.SPEED
	
	# Detection of movement direction to flip sprite
	if direction < 0:
		animation_player.flip_h = true
	elif direction > 0:
		animation_player.flip_h = false
		
	# Changes to idle state if x velocity reaches 0
	if parent.velocity.x == 0:
		ChangeState.emit(self, "idle")
	
	# Changes to slide state if on floor and down input is detected
	if parent.is_on_floor() and Input.is_action_just_pressed("down"):
		ChangeState.emit(self, "slide")
	
	parent.move_and_slide()


## _input(event) to detect if changes to jump state is needed
func update_event(_event : InputEvent):
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		ChangeState.emit(self, "jump")
