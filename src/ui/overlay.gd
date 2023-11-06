extends Control
class_name Overlay

## Manages various elements of the game, score, lives, and time
##
## Uses sprites to control UI based off score values
##

## Player Specific Values
var player_score : int
var player_lives : int
@onready var player : CharacterBody2D = get_node("../../Player")

## Level design
var time_remaining : float = 300.0
@export_file("*.tscn") var next_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_remaining -= delta
	if time_remaining <= 0:
		life_adjustment(-1)


## Called to set level values when player starts
func start_level(level_time : float):
	time_remaining = level_time


## Called when level is complete to adjust score
func level_complete():
	player_score += int(time_remaining)
	

## Adds score if player defeats and enemy
func add_score(value : int):
	player_score += value
	update_score_ui()


## Updates player lives count based on damage from enemy or pickup
func life_adjustment(value : int):
	player_lives += value
	update_lives_ui()
	
	if player_lives <= 0:
		game_over()


## Updates Score UI element
func update_score_ui():
	# TODO: Do some stuff here, sprites can be hard
	pass


## Updates Level Time Remaining UI element
func update_time_ui():
	# TODO: More stuff to do/figure out
	# Round down float time remaining to update sprites
	pass


## Updates Player Lives Count
func update_lives_ui():
	# TODO: Total lives update on screen
	# Called on player death or pickup of life item
	pass


## Transitions Screen to Game Over Screen, Updates Score
func game_over():
	get_tree().change_scene_to_file(next_scene)
