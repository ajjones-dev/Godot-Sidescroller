extends State
class_name PlayerWalk

@export var parent : CharacterBody2D

func enter():
	super()

func exit():
	super()

func update_physics(delta : float):
	parent.velocity.x = 0
	if not parent.is_on_floor():
		ChangeState.emit(self, "fall")

	var direction = Input.get_axis("left", "right")
	if direction:
		parent.velocity.x = direction * parent.SPEED
	
	if direction < 0:
		animation_player.flip_h = true
	elif direction > 0:
		animation_player.flip_h = false

	parent.move_and_slide()

func update_event(event : InputEvent):
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		ChangeState.emit(self, "jump")

