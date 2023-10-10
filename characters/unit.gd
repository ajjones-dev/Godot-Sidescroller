extends CharacterBody2D
class_name Unit

@export var speed : float = 100.0
@onready var anim_player = get_node("AnimatedSprite2D")
@onready var starting_position : Vector2 = self.global_position
var wander_position : Vector2 = Vector2()
var target_position : Vector2 = Vector2()
@export var travel_distance : float = 4.0
@export var chase_distance : float = 10.0
var target : CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = global_position.direction_to(target_position)
	velocity = direction * speed
	
	move_and_slide()

func _process(delta):
	_target_check()

func _target_check():
	if target != null:
		var distance_from_target = global_position.distance_to(target.global_position)
		if distance_from_target <= chase_distance:
			target_position = target.global_position
		else:
			target_position = wander_position
