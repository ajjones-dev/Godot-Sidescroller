extends Control

## Screen transition to move between levels
##
## Displays current level, health, and score
##

## Nodes to get for display
@onready var player_lives_label : Label = get_node("VBoxContainer/HBoxContainer/Lives")
@onready var player_score_label : Label = get_node("VBoxContainer/HBoxContainer2/Score")
@onready var prompt : Label = get_node("VBoxContainer/Prompt")
@onready var level_text : Label = get_node("VBoxContainer/Level Name")


# Called when the node enters the scene tree for the first time.
func _ready():
	level_text.text = str("Level ", PlayerVariables.current_level)
	player_lives_label.text = str(PlayerVariables.player_lives)
	player_score_label.text = str(PlayerVariables.player_score)
	await get_tree().create_timer(2).timeout
	prompt.visible = true


## Registers any event to start next level once visible
func _input(event):
	if prompt.visible and event.is_pressed():
		get_tree().change_scene_to_file(Levels.levels[PlayerVariables.current_level])
