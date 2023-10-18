extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.MOUSE_MODE_VISIBLE


func _on_start_pressed():
	get_tree().change_scene_to_file("res://temp.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://ui/options.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://ui/credits.tscn")


func _on_quit_pressed():
	get_tree().quit()
