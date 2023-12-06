extends Control

## Screen control for credits
##
## For now, only has back button
##

## Button to leave credits screen back to main
func _on_back_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
