extends Node

var gacha_processing = false
var rng = RandomNumberGenerator.new()
var gacha_luck = -1
var gacha_character = null
var character_class = preload("res://Scenes/Character.tscn")
onready var gacha_dialog = get_node("GachaDialog")

func _ready():
	if gacha_dialog.visible == true:
		gacha_dialog.visible = false
	get_node("ButtonVBox/GachaGacha").connect("pressed", self, "gacha_summoning")
	get_node("ButtonVBox/Cancel").connect("pressed", self, "pressed_cancel")

func gacha_summoning():
	if !gacha_processing:
		var gacha_index_max = CharacterImport.character_data.size() - 1
		gacha_processing = true
		init_gacha_ui()
		gacha_luck = rng.randi_range(0, gacha_index_max)
		gacha_character = character_class.instance()
		gacha_character._init_with_index(gacha_luck)
		gacha_gacha()
	
func gacha_gacha():
	var gacha_text = "You've unlocked %s!"
	var chara_name = gacha_character.get("gacha_name")

	gacha_dialog.get_node("GachaVBox/Label").text = gacha_text % chara_name
	gacha_dialog.get_node("GachaVBox/SlotContainer/Slot").add_child(gacha_character)
	pass
	
func init_gacha_ui():
	var pos = get_viewport().size
	var gacha_rect = gacha_dialog.get_rect().size
	
	
	gacha_dialog.visible = true
	gacha_dialog.set_position(
		Vector2((pos.x - gacha_rect.x) / 2, (pos.y - gacha_rect.y) / 2)
		)
	gacha_dialog.get_node("GachaVBox/Button").connect("pressed", self, "close_gacha")
	
func close_gacha():
	gacha_dialog.visible = false
	gacha_processing = false
	
func pressed_cancel():
	if !gacha_processing:
		get_tree().change_scene("res://Scenes/StartScreen.tscn")
	
