extends State
class_name PlayerIdle

@export var parent : CharacterBody2D

func enter():
	parent.velocity.x = 0
	if parent.is_on_floor():
		parent.jump_count = 0
		parent.has_double_jumped = false
	super()

func update_physics(delta : float):
	if not parent.is_on_floor():
		ChangeState.emit(self, "fall")
	elif Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		ChangeState.emit(self, "walk")

func update_event(event : InputEvent):
	if event.is_action_pressed("jump"):
		ChangeState.emit(self, "jump")
	elif event.is_action_pressed("left") or event.is_action_pressed("right"):
		ChangeState.emit(self, "walk")
