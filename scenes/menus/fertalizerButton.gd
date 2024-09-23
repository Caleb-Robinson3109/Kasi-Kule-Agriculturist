extends Button

@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.shopFertalizerPrice || Gloable.shopFertalizerPrice > 1000:
		button.theme = redButton
	else:
		button.theme = greenButton
		
func _on_pressed():
	if Gloable.wallet >= Gloable.shopFertalizerPrice && Gloable.shopFertalizerPrice <= 1000:
		Gloable.fertalizerBluePrice += 1
		Gloable.fertalizerRedPrice += 1
		Gloable.fertalizerYellowPrice += 1
		Gloable.wallet -= Gloable.shopFertalizerPrice
		Gloable.shopFertalizerPrice += 100
		if Gloable.shopFertalizerPrice > 1000:
			button.text = "MAX"
		else:
			button.text = "BUY\n$" + str(Gloable.shopFertalizerPrice)
		SavingAndLoad.save_nodes()
