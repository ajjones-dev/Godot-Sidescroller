extends Node
class_name State

## Individual State for State Machine
##
## Extend player and npc states, inherited functionality shared by all states. 
## Add State as Node under StateMachine in Player or NPC Scene with same name.
##

## Emitted singal to change between states
signal ChangeState

## Animations for sprites, match animation_name to animation in node
@export var animation_name : String
@onready var animation_player : AnimatedSprite2D = get_node("../../AnimatedSprite2D")

## Gravity variable standard
var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")


## Call funcation when entering state. Use Super() in specific state to add additional functionality.
func enter():
	animation_player.play(animation_name)


## Exit transition, called when state calls a new state to transition to.
func exit():
	animation_player.stop()


## Use in place of _input(event) to handle known and unknown inputs
func update_event(_event):
	pass


## Use in place of _process(delta)
func update_process(_delta):
	pass


## Use in place of _physics_process(delta) for CharacterBody2D models
func update_physics(_delta):
	pass
