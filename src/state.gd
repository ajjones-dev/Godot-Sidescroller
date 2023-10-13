extends Node
class_name State

@export var animation_name: String
signal ChangeState

var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")
var body : Unit

## Skeleton functions to be handled by individual states
func enter():
	body.anim_player.play(animation_name)

func exit():
	pass

func _input(event):
	pass

func _process(delta):
	pass

func _physics_process(delta):
	pass
