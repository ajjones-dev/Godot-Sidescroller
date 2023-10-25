extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = 600.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var state_machine : StateMachine = $StateMachine

func _ready():
	state_machine.init(self)

func _physics_process(delta):
	state_machine.update_physics(delta)

func _input(event):
	state_machine.update_event(event)

func _unhandled_input(event):
	state_machine.unhandled_event(event)
