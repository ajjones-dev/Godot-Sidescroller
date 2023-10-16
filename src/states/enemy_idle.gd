extends State
class_name EnemyIdle

@export var wait_time : float = 0.5

func enter():
	super()
	parent.velocity.x = 0.0
	parent.velocity.y = 0.0

func update_physics(delta):
	if wait_time > 0:
		wait_time -= delta
	else:
		ChangeState.emit(self, "walk")
