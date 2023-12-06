extends State
class_name EnemyIdle
## An extension on the [State] Class and a autonomos NPC Idle State
##
## Transitions to walk when wait_time reaches zero
##

## Parent node for accessing position and velocity for movement
@export var parent : CharacterBody2D

## Values for waiting in idle before changing position
@export var wait_time : float = 0.5
var current_wait_timer : float


## _ready(). Resets wait timer and velocity
func enter():
	current_wait_timer = wait_time
	parent.velocity.x = 0.0
	parent.velocity.y = 0.0
	
	super()


## physics_process(delta) counts down to zero before transition back to walk
func update_physics(delta):
	if current_wait_timer > 0.0:
		current_wait_timer -= delta
	else:
		ChangeState.emit(self, "walk")
