extends Button

func _ready():
	connect("pressed", self, "_button_pressed")

func _button_pressed():
	if get_node("../../Gacha").gacha_processing == false:
		get_node("../../Gacha").gacha_summoning()
