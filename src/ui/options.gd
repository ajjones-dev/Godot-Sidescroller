extends Control

## Options screen
##
## Providing a scene for setting button mapping and audio levels
## TBD
##


func _on_back_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
