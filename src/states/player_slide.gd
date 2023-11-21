extends State
class_name PlayerSlide

@export var parent : CharacterBody2D
var friction : float = 0.5

func enter():
	if parent.is_on_floor():
		parent.jump_count = 0
		parent.has_double_jumped = false
	parent.hitbox.disabled = true
	super()

func exit():
	parent.hitbox.disabled = false
	super()

func update_physics(delta : float):
	if not parent.is_on_floor():
		parent.jump_count += 1
		ChangeState.emit(self, "fall")

	parent.velocity.x -= parent.velocity.x * friction * delta
	parent.velocity.y = gravity * 0.7
	
	if parent.velocity.x == 0:
		ChangeState.emit(self, "idle")

	if not Input.is_action_pressed("down"):
		if (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
			ChangeState.emit(self, "walk")
		else:
			ChangeState.emit(self, "idle")
	
	parent.move_and_slide()

func update_event(event : InputEvent):
	if Input.is_action_just_pressed("jump"):
		parent.velocity.y = -parent.JUMP_VELOCITY / 5.0
		ChangeState.emit(self, "jump")
