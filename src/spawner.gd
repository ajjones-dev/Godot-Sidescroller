extends Node2D
class_name Spawner

## Creates designated enemy entity when boundary box is visible
##
## Will only spawn a new entity if there are no children
##

## Values for creation of spanwed enemy to be passed to "Create" Function
@export var enemy_type : Resource
@export var x_movement : float
@export var y_movement : float


## Is called when bounding box is visible
## Creates child node of the enemy type only if none exist
func _on_visible_on_screen_notifier_2d_screen_entered():
	var number_of_spawns = get_child_count()
	if number_of_spawns < 2:
		add_child(enemy_type.instantiate())
		var spawned_enemy = get_child(get_child_count() - 1)
		spawned_enemy.create(Vector2(x_movement,y_movement))
