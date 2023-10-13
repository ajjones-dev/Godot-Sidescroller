extends State
class_name Idle

@export var wait_time : float = 0.5

func enter():
	super()
	body.velocity.x = 0.0
	body.velocity.y = 0.0

func _physics_process(delta):
	if wait_time > 0:
		wait_time -= delta
	else:
		ChangeState.emit(self, "walk")
