extends State
class_name PlayerSlide

@export var parent : CharacterBody2D
var friction : float = 0.1

func enter():
	if parent.is_on_floor():
		parent.jump_count = 0
		parent.has_double_jumped = false
	parent.hitbox.scale = 0.5
	super()

func exit():
	parent.hitbox.scale = 1.0
	super()

func update_physics(delta : float):
	if not parent.is_on_floor():
		parent.jump_count += 1
		ChangeState.emit(self, "fall")

	var direction = Input.get_axis("left", "right")
	if direction:
		parent.velocity.x -= direction * parent.SPEED * friction
	
	if direction < 0:
		animation_player.flip_h = true
	elif direction > 0:
		animation_player.flip_h = false
		
	if parent.velocity.x == 0:
		ChangeState.emit(self, "idle")
	
	parent.move_and_slide()

func update_event(event : InputEvent):
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		ChangeState.emit(self, "jump")