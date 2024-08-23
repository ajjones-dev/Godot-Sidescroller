extends Node

## Tracking player session data
var player_score : int
var player_lives : int
var current_level : int

## Tracking game data for persist across sessions
var highscores_file : String = "user://highscore.json"
var options : String = "user://options.json"


## Create High Score file if DNE
func create_highscore():
	DirAccess.copy_absolute("res://resources/highscore.json", highscores_file)


## Load High Scores into memory
func load_highscore():
	if not FileAccess.file_exists(highscores_file):
		create_highscore()
	
	var _file = FileAccess.open(highscores_file, FileAccess.READ)
	


## Write High Score file on close
func save_highscore():
	pass


## Update high score 
func update_highscore():
	pass
