extends State
class_name EnemyIdle

@export var wait_time : float = 0.5
var current_wait_timer : float
@export var parent : CharacterBody2D

func enter():
	super()
	current_wait_timer = wait_time
	parent.velocity.x = 0.0
	parent.velocity.y = 0.0

func update_physics(delta):
	if current_wait_timer > 0:
		current_wait_timer -= delta
	else:
		ChangeState.emit(self, "walk")
