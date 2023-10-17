extends State
class_name EnemyFall

@export var parent : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func enter():
	super()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_physics(delta):
	if not parent.is_on_floor():
		parent.velocity.y += gravity * delta
		animation_player.flip_v = true
		parent.move_and_slide()
	else:
		animation_player.flip_v = false
		ChangeState.emit(self, "idle")
