extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerVariables.player_score = 0
	PlayerVariables.player_lives = 3


func _on_start_pressed():
	PlayerVariables.current_level = 1
	get_tree().change_scene_to_file("res://ui/level_transition.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://ui/options.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://ui/credits.tscn")


func _on_quit_pressed():
	get_tree().quit()
