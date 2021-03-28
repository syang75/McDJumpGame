extends Node2D

var gacha_name: String
var gacha_sprite

func _init_with_index(index):
	gacha_name = CharacterImport.character_data.keys()[index]
	gacha_sprite = load(CharacterImport.character_data[gacha_name]["Img"])
	get_node("TextureRect").texture = gacha_sprite
	
	
