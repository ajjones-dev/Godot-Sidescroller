extends State
class_name EnemyFall

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not body.is_on_floor():
		body.velocity.y += gravity * delta
		body.move_and_slide()
	else:
		ChangeState.emit(self, "idle")
