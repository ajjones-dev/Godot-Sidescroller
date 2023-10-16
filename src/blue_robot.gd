extends CharacterBody2D

@onready var state_machine : StateMachine = $StateMachine
@export var speed : float = 30.0
var starting_position : Vector2 = Vector2()
@export var move_direction: Vector2 = Vector2()
var target_position : Vector2 = Vector2()

func _ready():
	state_machine.init(self)

func _physics_process(delta):
	state_machine.update_physics(delta)

func die():
	queue_free()
