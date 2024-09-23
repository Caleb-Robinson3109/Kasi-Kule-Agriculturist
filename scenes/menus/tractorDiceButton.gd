extends Button
@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.diceTractorPrice:
		button.theme = redButton
	else:
		button.theme = greenButton

func _on_pressed():
	if Gloable.wallet >= Gloable.diceTractorPrice:
		Gloable.dice.push_back("tractor")
		Gloable.wallet -= Gloable.diceTractorPrice
		Gloable.diceTractorPrice += 200
		button.text = "BUY\n$" + str(Gloable.diceTractorPrice)
		SavingAndLoad.save_nodes()
