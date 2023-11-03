extends Area2D

@export_file("*.tscn") var next_scene
@onready var animation_player : AnimatedSprite2D = get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("default")


func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(next_scene)
