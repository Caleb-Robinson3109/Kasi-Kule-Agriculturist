extends Button
@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.shopWateringCanPrice || !(Gloable.wateringCanSpawnRate >= 0.05):
		button.theme = redButton
	else:
		button.theme = greenButton


func _on_pressed():
	if Gloable.wallet >= Gloable.shopWateringCanPrice && Gloable.wateringCanSpawnRate >= 0.05:
		Gloable.wateringCanSpawnRate -= 0.05
		Gloable.wallet -= Gloable.shopWateringCanPrice
		Gloable.shopWateringCanPrice += 100
		if Gloable.shopWateringCanPrice <= 1000:
			button.text = "BUY\n$" + str(Gloable.shopWateringCanPrice)
		else:
			button.text = "MAX"
		SavingAndLoad.save_nodes()
