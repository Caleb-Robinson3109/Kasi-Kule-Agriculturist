extends Button

@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.shopToolsPrice:
		button.theme = redButton
	else:
		button.theme = greenButton


func _on_pressed():
	if Gloable.wallet >= Gloable.shopToolsPrice:
		Gloable.maxNumFlowers += 1
		Gloable.wallet -= Gloable.shopToolsPrice
		Gloable.shopToolsPrice += 100
		button.text = "BUY\n$" + str(Gloable.shopToolsPrice)
		SavingAndLoad.save_nodes()
