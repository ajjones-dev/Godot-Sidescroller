extends Area2D
class_name FinishFlag

## Entity responsible for moving bewteen end of level to start of next
## 
## Increments global level counter to prepare next transition
## Emits signal for overlay to score
##

## Value for next scene, should be the transition scren
@export_file("*.tscn") var next_scene

## Flag animation to be played on loop
@onready var animation_player : AnimatedSprite2D = get_node("AnimatedSprite2D")

## Emits signal when player reaches level end. Overlay reads signal for scoring.
signal LevelCompleted


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("default")


## When the player enters the body, it increments current level and advances scene.
func _on_body_entered(body):
	if body.is_in_group("player"):
		PlayerVariables.current_level += 1
		LevelCompleted.emit()
		get_tree().change_scene_to_file(next_scene)
