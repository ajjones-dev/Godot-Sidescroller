extends CharacterBody2D
class_name Mouse

@onready var state_machine : StateMachine = $StateMachine
@export var speed : float = 90.0
var starting_position : Vector2 = Vector2()
@export var move_direction: Vector2 = Vector2()
var target_position : Vector2 = Vector2()

func _ready():
	if not move_direction:
		move_direction = Vector2(-100, 0)
	state_machine.init(self)

func _physics_process(delta):
	state_machine.update_physics(delta)

func die():
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func create(spawned_direction : Vector2) -> void:
	move_direction = spawned_direction
	starting_position = global_position
