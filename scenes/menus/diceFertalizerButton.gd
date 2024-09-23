extends Button
@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.diceFertalizerPrice:
		button.theme = redButton
	else:
		button.theme = greenButton

func _on_pressed():
	if Gloable.wallet >= Gloable.diceFertalizerPrice:
		Gloable.dice.push_back("fertalizer")
		Gloable.wallet -= Gloable.diceFertalizerPrice
		Gloable.diceFertalizerPrice += 200
		button.text = "BUY\n$" + str(Gloable.diceFertalizerPrice)
		SavingAndLoad.save_nodes()
