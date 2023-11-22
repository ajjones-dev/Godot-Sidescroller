extends CharacterBody2D
class_name Mouse

## Basic enemy class, small hitbox and damage vector
##
## Can only move and fall according to a specific range given at load
## Don't add directly to a scene, add to an enemy spawner to manage
##

## Mouse Variables
const SPEED : float = 90.0
var value : int = 5
var damage_timer : float = 0.0
var damage_speed : float = 2.0

## Scene Variables
var starting_position : Vector2 = Vector2()
@export var move_direction: Vector2 = Vector2()
var target_position : Vector2 = Vector2()
var not_on_wall : bool = true

## Interaction Nodes
@onready var state_machine : StateMachine = $StateMachine
@onready var hurt_vector : RayCast2D = get_node("HurtVector")


## Called at start, initializes State Machine
func _ready():
	state_machine.init(self)


## Passes Delta to State Machine for Process
## Checks for player collision with hurt vector
func _physics_process(delta):
	if hurt_vector.is_colliding() and hurt_vector.get_collider().is_in_group("player"):
		if hurt_vector.get_collider().has_method("take_damage") and damage_timer > damage_speed:
			hurt_vector.get_collider().take_damage()
			damage_timer = 0.0
	
	damage_timer += delta
	
	state_machine.update_physics(delta)


## Called when player hits enemy weak spot
func die(body):
	body.add_score(value)
	queue_free()


## Deletes enemy from memory if no longer visible
## Visible box much larger than mouse
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


## Called when Enemy Spawner is used to instantiate instance of Mouse
func create(spawned_direction : Vector2) -> void:
	move_direction = spawned_direction
	starting_position = global_position


## Checks if player's collision makes contact with the Area2D Weak Spot 
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		die(body)
