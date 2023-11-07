extends CharacterBody2D
class_name Mouse

@onready var state_machine : StateMachine = $StateMachine
@export var speed : float = 90.0
var starting_position : Vector2 = Vector2()
@export var move_direction: Vector2 = Vector2()
var target_position : Vector2 = Vector2()
var not_on_wall : bool = true
@onready var hurt_vector : RayCast2D = get_node("HurtVector")
var value : int = 5

func _ready():
	state_machine.init(self)

func _physics_process(delta):
	if hurt_vector.is_colliding() and hurt_vector.get_collider().has_method("take_damage"):
		hurt_vector.get_collider().take_damage()
	state_machine.update_physics(delta)

func die(body):
	body.add_score(value)
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func create(spawned_direction : Vector2) -> void:
	move_direction = spawned_direction
	starting_position = global_position


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		die(body)
