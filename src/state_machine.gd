extends Node

@export var initial_state : State
var current_state : State
var states : Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.ChangeState.connect(change_state)

func _init():
	pass

func change_state(calling_state : State, new_state):
	if current_state != calling_state:
		return
	
	if current_state:
		current_state.exit()
	
	current_state = states.get(new_state.to_lower())
	current_state.enter()

func _physics_process(delta):
	if current_state:
		current_state._physics_process(delta)

func _process(delta):
	if current_state:
		current_state._process(delta)

func _input(event):
	pass
