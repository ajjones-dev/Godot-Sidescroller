extends State
class_name PlayerFall

@export var parent : CharacterBody2D

func update_physics(delta):
	if not parent.is_on_floor():
		parent.velocity.y += gravity * delta
		parent.move_and_slide()
	else:
		ChangeState.emit(self, "idle")
	
	var direction = Input.get_axis("left", "right")
	if direction:
		parent.velocity.x = direction * parent.SPEED
	
	if direction < 0:
		animation_player.flip_h = true
	elif direction > 0:
		animation_player.flip_h = false
	
	if Input.is_action_just_pressed("jump") and parent.jump_count <= parent.MAX_JUMP and not parent.has_double_jumped:
		parent.velocity.y = 0
		parent.has_double_jumped = true
		ChangeState.emit(self, "jump")

func update_event(event : InputEvent):
	if event.is_action_pressed("left") or event.is_action_pressed("right"):
		ChangeState.emit(self, "walk")
