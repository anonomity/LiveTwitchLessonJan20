extends CharacterBody2D


const SPEED = 300.0
@onready var animation_player = $AnimationPlayer
@onready var swing_area = $swing_area

var damage_amount = 20
func _physics_process(delta):
	if Input.is_action_just_pressed("swing"):
		animation_player.play("swing")
	var direction = Input.get_vector( "ui_left","ui_right","ui_up","ui_down")
	if direction:
		velocity = direction * SPEED
		if velocity.x > 0:
			swing_area.scale = Vector2(1,1)
		else:
			swing_area.scale = Vector2(-1,1)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()


func _on_swing_area_area_entered(area):
	var enemy = area.get_parent()
	enemy.take_damage(damage_amount)
