extends Button
@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.diceSeedsPrice:
		button.theme = redButton
	else:
		button.theme = greenButton

func _on_pressed():
	if Gloable.wallet >= Gloable.diceSeedsPrice:
		Gloable.dice.push_back("seeds")
		Gloable.wallet -= Gloable.diceSeedsPrice
		Gloable.diceSeedsPrice += 200
		button.text = "BUY\n$" + str(Gloable.diceSeedsPrice)
		SavingAndLoad.save_nodes()
