extends Node2D

var gacha_name = ""

func _init(name, img):
	gacha_name = name
	get_node("TextureRect").texture = img
