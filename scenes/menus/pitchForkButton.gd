extends Button

@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.shopPitchForkPrice || Gloable.shopPitchForkPrice > 1000:
		button.theme = redButton
	else:
		button.theme = greenButton

func _on_pressed():
	if Gloable.wallet >= Gloable.shopPitchForkPrice && Gloable.shopPitchForkPrice <= 1000:
		Gloable.pitchForkMaxNumFlowers += 3
		Gloable.wallet -= Gloable.shopPitchForkPrice
		Gloable.shopPitchForkPrice += 100
		if Gloable.shopPitchForkPrice > 1000:
			button.text = "MAX"
		else:
			button.text = "BUY\n$" + str(Gloable.shopPitchForkPrice)
		SavingAndLoad.save_nodes()
