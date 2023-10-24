extends State
class_name PlayerJump

@export var parent : CharacterBody2D

func enter():
	parent.velocity.y -= parent.JUMP_VELOCITY
	super()

func update_physics(delta : float):
	parent.move_and_slide()
	ChangeState.emit(self, "fall")

func update_event(event : InputEvent):
	pass

