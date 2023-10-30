extends Node2D
class_name Spawner

@export var enemy_type : Resource
@export var x_movement : float
@export var y_movement : float

var spawned_enemies : Array
var enemy

func _ready():
	enemy = enemy_type.instantiate()

func _on_visible_on_screen_notifier_2d_screen_entered():
	if spawned_enemies.size() == 0:
		add_child(enemy)
		spawned_enemies.append(enemy)
