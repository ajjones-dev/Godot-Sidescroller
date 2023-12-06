extends State
class_name PlayerIdle

## An extension on the [State] Class and a Player Idle State
##
## Turns off animation when no input is detected and player is on surface
## Transitions to:
## fall, walk, jump
##

## Link to parent node for accessing properties
@export var parent : CharacterBody2D


## _ready(). Resets jump counter and boolean for double jump
func enter():
	parent.velocity.x = 0
	
	if parent.is_on_floor():
		parent.jump_count = 0
		parent.has_double_jumped = false
	
	super()


## _physics_process(delta). Awaits transition conditions
func update_physics(delta : float):
	if not parent.is_on_floor():
		ChangeState.emit(self, "fall")
	elif Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		ChangeState.emit(self, "walk")


## _input(event). Detects mapped events to transition states
func update_event(event : InputEvent):
	if event.is_action_pressed("jump"):
		ChangeState.emit(self, "jump")
	elif event.is_action_pressed("left") or event.is_action_pressed("right"):
		ChangeState.emit(self, "walk")
