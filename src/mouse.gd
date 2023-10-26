extends CharacterBody2D
class_name Mouse

@onready var state_machine : StateMachine = $StateMachine
@export var speed : float = 90.0
var starting_position : Vector2 = Vector2()
@export var move_direction: Vector2 = Vector2()
var target_position : Vector2 = Vector2()

func _ready():
	state_machine.init(self)

func _physics_process(delta):
	state_machine.update_physics(delta)

func create(x_movement : float, y_movement : float) -> CharacterBody2D:
	move_direction = Vector2(x_movement, y_movement)
	return self

func die():
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
