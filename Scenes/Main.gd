extends Node2D
#states: start,playing,game_over
var state = "start"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player_alive;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		"start":
			if !player_alive:
				spawn_player()
		"playing":
			print("state: playing")
		"game_over":
			print("state: game_over")

#if state == start
func spawn_player():
	player_alive = true;
	var player = load("Player.tscn").new()
	player.set_pos(25,30)

#if state==playing or enemy_died signal emits
func spawn_enemy():
	pass




func _on_StartButton_pressed():
	state = "playing"
	get_node("StartButton").hide()

func _on_Player_player_died():
	state = "game_over"
