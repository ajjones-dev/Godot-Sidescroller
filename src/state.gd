extends Node
class_name State

@export var animation_name: String
signal ChangeState

var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var parent : CharacterBody2D = $CharacterBody2D

## Skeleton functions to be handled by individual states
func enter():
	parent.anim_player.play(animation_name)

func exit():
	pass

func update_event(event):
	pass

func update_process(delta):
	pass

func update_physics(delta):
	pass
