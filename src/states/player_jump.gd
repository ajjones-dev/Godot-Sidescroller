extends State
class_name PlayerJump

@export var parent : CharacterBody2D

func enter():
	parent.velocity.y -= parent.JUMP_VELOCITY
	super()

func update_physics(delta : float):
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		ChangeState.emit(self, "fall")
	parent.move_and_slide()

func update_event(event : InputEvent):
	if event.is_action_pressed("left") or event.is_action_pressed("right"):
		ChangeState.emit(self, "walk")

