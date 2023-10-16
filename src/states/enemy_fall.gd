extends State
class_name EnemyFall

# Called when the node enters the scene tree for the first time.
func enter():
	super()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_physics(delta):
	if not parent.is_on_floor():
		parent.velocity.y += gravity * delta
		parent.move_and_slide()
	else:
		ChangeState.emit(self, "idle")
