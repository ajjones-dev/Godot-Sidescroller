extends Node2D
class_name Spawner

@export var enemy_type : Resource
@export var x_movement : float
@export var y_movement : float

func _ready():
	pass

func _on_visible_on_screen_notifier_2d_screen_entered():
	var number_of_spawns = get_child_count()
	if number_of_spawns < 2:
		add_child(enemy_type.instantiate())
		var spawned_enemy = get_child(get_child_count() - 1)
		spawned_enemy.create(Vector2(x_movement,y_movement))
