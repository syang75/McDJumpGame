extends KinematicBody2D

export var speed = 3

func _physics_process(delta):
	position += Vector2(-speed,0)
	
	if position.x < -25:
		die()
	


func die(): #die if out of bounds of the screen
	queue_free()
	print("Enemy killed.")


