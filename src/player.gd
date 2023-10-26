extends CharacterBody2D
class_name Player
## The CharacterBody2D controlled by the player through input.
##
## All actions are passed through to a [StateMachine] to handle
## animations and physics updates.

const SPEED = 300.0
const JUMP_VELOCITY = 600.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var state_machine : StateMachine = $StateMachine

# Initialize State Machine to handle different player states and abilities
func _ready():
	state_machine.init(self)


# Hands off delta to state machine to update player's physics
func _physics_process(delta : float) -> void:
	state_machine.update_physics(delta)


# Takes in mapped inputs in order to change to appropriate state
func _input(event : InputEvent) -> void:
	state_machine.update_event(event)


# Removes errors from unmapped events with empty function
func _unhandled_input(event : InputEvent) -> void:
	state_machine.unhandled_event(event)
