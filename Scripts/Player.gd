extends KinematicBody2D

export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false

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
