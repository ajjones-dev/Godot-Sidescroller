extends Node2D
class_name Spawner

@export var enemy_type : Resource
@export var x_movement : float
@export var y_movement : float

var spawned_enemies : Array
var enemy

func _ready():
	pass

func _on_visible_on_screen_notifier_2d_screen_entered():
	enemy = enemy_type.instantiate()
	enemy.create(Vector2(enemy.position.x - x_movement, enemy.position.y - y_movement))
	var number_of_spawns = get_child_count()
	if number_of_spawns < 2:
		add_child(enemy)
		spawned_enemies.append(enemy)
