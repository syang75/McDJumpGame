extends Node

var gacha_processing = false
var rng = RandomNumberGenerator.new()
var gacha_luck = -1
var gacha_list = ["blue", "red", "yellow"]
onready var gacha_dialog = get_node("../GachaDialog")

func gacha_summoning():
	var gacha_index_max = gacha_list.size() - 1
	gacha_processing = true
	init_gacha_ui()
	gacha_luck = rng.randi_range(0, gacha_index_max)
	gacha_gacha()
	gacha_processing = false
	
func gacha_gacha():
	var gacha_text = "You've unlocked %s!"
	gacha_dialog.get_node("GachaVBox/Label").text = gacha_text % gacha_list[gacha_luck]
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
