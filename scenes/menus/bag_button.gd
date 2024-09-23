extends Button

var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")
@onready var button = $"."

func _process(delta):
	if Gloable.wallet >= Gloable.shopBagPrice:
		button.theme = greenButton
	else:
		button.theme = redButton

func _on_pressed():
	if Gloable.wallet >= Gloable.shopBagPrice:
		Gloable.bagSize += 1
		Gloable.wallet -= Gloable.shopBagPrice
		Gloable.shopBagPrice += 100
		button.text = "BUY\n$" + str(Gloable.shopBagPrice)
		SavingAndLoad.save_nodes()
