extends Button

@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.shopClockPrice || Gloable.pupTime >= 20:
		button.theme = redButton
	else:
		button.theme = greenButton



func _on_pressed():
	if Gloable.wallet >= Gloable.shopClockPrice && Gloable.pupTime != 20:
		Gloable.pupTime +=2
		Gloable.wallet -= Gloable.shopClockPrice
		Gloable.shopClockPrice += 100
		if Gloable.pupTime >= 20:
			button.text = "MAX"
		else:
			button.text = "BUY\n$" + str(Gloable.shopClockPrice) 
		SavingAndLoad.save_nodes()
