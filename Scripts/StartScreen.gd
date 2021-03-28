extends Node2D


onready var chara_button = get_node("ButtonContainer/Characters")
onready var gacha_button = get_node("ButtonContainer/Gacha")
onready var start_button = get_node("ButtonContainer/StartGame")


func _ready():
	gacha_button.connect("pressed", self, "start_gacha")
	start_button.connect("pressed", self, "start_game")


func start_gacha():
	get_tree().change_scene("res://Scenes/Gacha.tscn")

func start_game():
	get_tree().change_scene("res://Scenes/Main.tscn")
