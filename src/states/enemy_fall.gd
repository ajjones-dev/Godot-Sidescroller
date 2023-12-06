extends State
class_name EnemyFall
## An extension on the [State] Class and a autonomos NPC Fall State
##
## Transitions to idle when NPC hits the ground
##

## Parent node for accessing position and velocity for movement
@export var parent : CharacterBody2D


## _physics_process(delta) adds gravity to y velocity
func update_physics(delta):
	if not parent.is_on_floor():
		parent.velocity.y += gravity * delta
		animation_player.flip_v = true
		parent.move_and_slide()
	else:
		animation_player.flip_v = false
		ChangeState.emit(self, "idle")
