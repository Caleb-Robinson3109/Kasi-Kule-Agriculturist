extends Button

@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")
var blueFlower = preload("res://flower.tscn")
var redFlower = preload("res://red flower.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.shopSeedsPrice || Gloable.shopSeedsPrice > 1000:
		button.theme = redButton
	else:
		button.theme = greenButton

func _on_pressed():
	if Gloable.wallet >= Gloable.shopSeedsPrice && Gloable.shopSeedsPrice <= 1000:
		if Gloable.shopSeedsPrice > 500:
			Gloable.flowersSeeds.push_back(blueFlower)
		else:
			Gloable.flowersSeeds.push_back(blueFlower)
			Gloable.flowersSeeds.push_back(redFlower)
		Gloable.wallet -= Gloable.shopSeedsPrice
		Gloable.shopSeedsPrice += 100
		if Gloable.shopSeedsPrice > 1000:
			button.text = "MAX"
		else:
			button.text = "BUY\n$" + str(Gloable.shopSeedsPrice)
		SavingAndLoad.save_nodes()
