extends Node
class_name StateMachine

## Controls [CharacterBody2D] transition between [State]
##
## States are added as children nodes and gathered at runtime 
## allowing for reusable code between different character types.
##

## The starting state for the Character, usually some variation on Idle
@export var initial_state : State

## Current state, tracked to make sure Change State is called only by active state.
var current_state : State

## A Dictionary States where the key is lowercase of the Node's State name
var states : Dictionary = {}


## Initialzes the state machine by grabbing child state nodes and adding
## to a dictonary.
func init(_parent : CharacterBody2D) -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.ChangeState.connect(change_state)
			
	current_state = initial_state


## Handles state changes called by individual states
func change_state(calling_state : State, new_state : String) -> void:
	if current_state != calling_state:
		return
	
	if current_state:
		current_state.exit()
	
	current_state = states.get(new_state.to_lower())
	current_state.enter()


## Replaces default _physics_process function, called by CharacterBody
func update_physics(delta : float) -> void:
	if current_state:
		current_state.update_physics(delta)


## Replaces default _process function, called by CharacterBody
func update_process(delta : float) -> void:
	if current_state:
		current_state.update_process(delta)


## Replaces default _input function, called by CharacterBody
func update_event(event : InputEvent) -> void:
	if current_state:
		current_state.update_event(event)


## Replaces default _unhandled_input function, called by CharacterBody
func unhandled_event(_event : InputEvent) -> void:
	pass
