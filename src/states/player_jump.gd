extends State
class_name PlayerJump

@export var parent : CharacterBody2D

func enter():
	parent.velocity.y -= parent.JUMP_VELOCITY
	parent.jump_count += 1
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
	
	if Input.is_action_just_pressed("jump") and parent.jump_count <= parent.max_jump and not parent.has_double_jumped and not parent.is_on_floor():
		parent.jump_count += 1
		parent.velocity.y -= parent.JUMP_VELOCITY / 2
		parent.has_double_jumped = true
		
	parent.move_and_slide()

func update_event(event : InputEvent):
	if event.is_action_pressed("left") or event.is_action_pressed("right"):
		ChangeState.emit(self, "walk")

