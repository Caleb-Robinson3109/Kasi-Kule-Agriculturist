extends Button
@onready var upgrade_shop = $"../../../../../../.."


func _on_pressed():
	upgrade_shop.get_node("ani").queue("transOut")
	Gloable.lastAniShop = "out"


func _on_button_pressed():
	pass # Replace with function body.
