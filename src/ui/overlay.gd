extends Control
class_name Overlay

## Manages various elements of the game, score, lives, and time
##
## Uses sprites to control UI based off score values
##

## Player Specific Values
var player_score : int
var player_lives : int
@onready var player : CharacterBody2D = get_node("res://Main/Player")

## Level design
var time_remaining : float


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_remaining -= delta
	if time_remaining <= 0:
		player.die()


## Called to set level values when player starts
func start_level(level_time : float):
	time_remaining = level_time


## Called when level is complete to adjust score
func level_complete():
	player_score += int(time_remaining)
	

## Adds score if player defeats and enemy
func add_score(value : int):
	player_score += value
	update_score()


## Updates score UI element
func update_score():
	# TODO: Do some stuff here, sprites can be hard
	pass
