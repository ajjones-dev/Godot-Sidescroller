class_name State
extends Node

@export var animation_name: String
@export var move_speed: float = 400

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

## Skeleton functions to be handled by individual states
func enter():
	pass

func exit():
	pass

func _input(event):
	pass

func _process(delta):
	pass

func _physics_process(delta):
	pass
