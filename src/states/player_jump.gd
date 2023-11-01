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
	
	var direction = Input.get_axis("left", "right")
	if direction:
		parent.velocity.x = direction * parent.SPEED
	
	if direction < 0:
		animation_player.flip_h = true
	elif direction > 0:
		animation_player.flip_h = false
		
	parent.move_and_slide()

func update_event(event : InputEvent):
	if event.is_action_pressed("left") or event.is_action_pressed("right"):
		ChangeState.emit(self, "walk")

