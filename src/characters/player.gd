extends CharacterBody2D
class_name Player
## The CharacterBody2D controlled by the player through input.
##
## All actions are passed through to a [StateMachine] to handle
## animations and physics updates.

## User physics specific variables
const SPEED : float = 300.0
const JUMP_VELOCITY : float = 600.0
const MAX_JUMP : int = 2
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

## Tracking Double Jump status
var jump_count : int
var has_double_jumped : bool

## Nodes used in tracking player and game state
@onready var state_machine : StateMachine = $StateMachine
var overlay : Overlay


## Initialize State Machine to handle different player states and abilities
func _ready():
	overlay = get_node("../CanvasLayer/Overlay")
	jump_count = 0
	has_double_jumped = false
	state_machine.init(self)


## Hands off delta to state machine to update player's physics
func _physics_process(delta : float) -> void:
	state_machine.update_physics(delta)


## Takes in mapped inputs in order to change to appropriate state
func _input(event : InputEvent) -> void:
	state_machine.update_event(event)


## Removes errors from unmapped events with empty function
func _unhandled_input(event : InputEvent) -> void:
	state_machine.unhandled_event(event)


## Takes enemy score from body_entered signal
func add_score(value : int) -> void:
	overlay.add_score(value)
