extends KinematicBody2D

export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false

signal player_died

func get_input():
	var jump = Input.is_action_just_pressed('ui_accept')

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed


func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func _process(delta):
	#if collide with instance in group enemy, emit signal to kill player
	var collision = move_and_collide(velocity * delta)
	#destroy and emit signal if player collide with enemy
	if collision && collision.collider.is_in_group("enemies"):
		print("ENEMY COLLIDED")
		queue_free()
		emit_signal("player_died")
