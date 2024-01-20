extends CharacterBody2D


@onready var navigation_agent_2d = $NavigationAgent2D
@export var SPEED : float = 300.0
@export var target : CharacterBody2D
@onready var health_bar = $health_bar

var health : int = 100

func _physics_process(delta):
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity = dir * SPEED
	move_and_slide()


func _on_timer_timeout():
	navigation_agent_2d.target_position = target.global_position

func take_damage(amount : int):
	health -= amount
	health_bar.value = health
	if health <= 0:
		queue_free()
