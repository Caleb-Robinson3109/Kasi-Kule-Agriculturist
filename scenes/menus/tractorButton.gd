extends Button
@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.shopTractorPrice || Gloable.tractorSpeed >= 550:
		button.theme = redButton
	else:
		button.theme = greenButton


func _on_pressed():
	if Gloable.wallet >= Gloable.shopTractorPrice && Gloable.tractorSpeed < 550:
		Gloable.tractorSpeed += 25
		Gloable.wallet -= Gloable.shopTractorPrice
		Gloable.shopTractorPrice += 100
		if Gloable.tractorSpeed < 550:
			button.text = "BUY\n$" + str(Gloable.shopTractorPrice)
		else:
			button.text = "MAX"
		SavingAndLoad.save_nodes()
