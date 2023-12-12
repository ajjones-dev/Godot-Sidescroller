extends Control
class_name MainMenu

## Main menu, starting screen
##
## Return here after game over
##


## Called when the node enters the scene tree for the first time.
func _ready():
	PlayerVariables.player_score = 0
	PlayerVariables.player_lives = 3
	$MarginContainer/HBoxContainer/VBoxContainer/Start.grab_focus()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


## Initiates start of game
func _on_start_pressed():
	PlayerVariables.current_level = 1
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().change_scene_to_file("res://ui/level_transition.tscn")


## Takes to new control scene for options menu
func _on_options_pressed():
	get_tree().change_scene_to_file("res://ui/options.tscn")


## Loads credits scene
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://ui/credits.tscn")


## Quits tree and exits
func _on_quit_pressed():
	get_tree().quit()
