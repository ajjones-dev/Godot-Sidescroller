extends State
class_name EnemyWalk

@export var parent : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func init(parent):
	parent.starting_position = parent.position
	parent.target_position = parent.starting_position + parent.move_direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_process(delta):
	pass
