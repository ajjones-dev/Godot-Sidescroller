extends State
class_name EnemyWalk

# Called when the node enters the scene tree for the first time.
func init(body):
	body.starting_position = body.position
	body.target_position = body.starting_position + body.move_direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
