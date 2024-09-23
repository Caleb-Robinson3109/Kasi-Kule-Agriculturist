extends Button
@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.diceWateringCanPrice:
		button.theme = redButton
	else:
		button.theme = greenButton




func _on_pressed():
	if Gloable.wallet >= Gloable.diceWateringCanPrice:
		Gloable.dice.push_back("wateringCan")
		Gloable.wallet -= Gloable.diceWateringCanPrice
		Gloable.diceWateringCanPrice += 200
		button.text = "BUY\n$" + str(Gloable.diceWateringCanPrice)
		SavingAndLoad.save_nodes()
