extends State
class_name PlayerWalk

@export var parent : CharacterBody2D

func enter():
	if parent.is_on_floor():
		parent.jump_count = 0
		parent.has_double_jumped = false
	super()

func exit():
	super()

func update_physics(delta : float):
	parent.velocity.x = 0
	if not parent.is_on_floor():
		parent.jump_count += 1
		ChangeState.emit(self, "fall")

	var direction = Input.get_axis("left", "right")
	if direction:
		parent.velocity.x = direction * parent.SPEED
	
	if direction < 0:
		animation_player.flip_h = true
	elif direction > 0:
		animation_player.flip_h = false
	
	parent.raycast.target_position = Vector2(parent.velocity.x, 0) * 40.0
	
	if parent.velocity.x == 0:
		ChangeState.emit(self, "idle")
	
	parent.move_and_slide()

func update_event(event : InputEvent):
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		ChangeState.emit(self, "jump")

