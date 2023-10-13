extends Node

@export var initial_state : State
var current_state : State

func _init():
	pass

func change_state(new_state : State):
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

func _physics_process(delta):
	pass

func _process(delta):
	pass

func _input(event):
	pass
