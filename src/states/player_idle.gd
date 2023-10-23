extends State
class_name PlayerIdle

func enter():
	animation_player.play(animation_name)

func exit():
	animation_player.stop()

func update_event(event):
	pass

func update_process(delta):
	pass

func update_physics(delta):
	pass
