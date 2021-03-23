extends KinematicBody2D

export var speed = 3

func _physics_process(delta):
	position += Vector2(-speed,0)
	
func process(delta):
	pass
	#if enemy position x less than

func die(): #die if out of bounds of the screen
	queue_free()
