extends Button
@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.dicePitchForkPrice:
		button.theme = redButton
	else:
		button.theme = greenButton



func _on_pressed():
	if Gloable.wallet >= Gloable.dicePitchForkPrice:
		Gloable.dice.push_back("pitchFork")
		Gloable.wallet -= Gloable.dicePitchForkPrice
		Gloable.dicePitchForkPrice += 200
		button.text = "BUY\n$" + str(Gloable.dicePitchForkPrice)
		SavingAndLoad.save_nodes()
