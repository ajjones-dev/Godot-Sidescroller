extends State
class_name PlayerSlide

## Slide state for player controlled CharacterBody2D
##
## Initialized by state machine onready. Adjusts hitbox for smaller profile.
##

@export var parent : CharacterBody2D

## Rate of slowdown due to friction when sliding on flat surface
var friction : float = 0.5

## Adds to y velocity to increase speed on slopes
var downslope_slide_boost : float = 0.7

## Adds a fraction of jump height to player during slide jump.
## Smaller number is a higher jump
var jump_boost : float = 5.0

## Resets jump counter if on the floor. Disables the full body hitbox.
func enter():
	if parent.is_on_floor():
		parent.jump_count = 0
		parent.has_double_jumped = false
		
	parent.hitbox.disabled = true
	
	super()


## Enables the full body hitbox on exit.
func exit():
	parent.hitbox.disabled = false
	super()


## Processes movement, slows down character body on flat surface for "friction".
func update_physics(delta : float):
	if not parent.is_on_floor():
		parent.jump_count += 1
		ChangeState.emit(self, "fall")

	parent.velocity.x -= parent.velocity.x * friction * delta
	parent.velocity.y = gravity * downslope_slide_boost
	
	if parent.velocity.x == 0:
		ChangeState.emit(self, "idle")

	# Checks if "down" action is released to change state
	if not Input.is_action_pressed("down"):
		if (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
			ChangeState.emit(self, "walk")
		else:
			ChangeState.emit(self, "idle")
	
	parent.move_and_slide()


## Processes jump input, adds bonus height for a slide jump
func update_event(event : InputEvent):
	if Input.is_action_just_pressed("jump"):
		parent.velocity.y = -parent.JUMP_VELOCITY / jump_boost
		ChangeState.emit(self, "jump")
