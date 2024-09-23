extends Button
@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.shopGMOSeedsPrice:
		button.theme = redButton
	else:
		button.theme = greenButton
		

func _on_pressed():
	if Gloable.wallet >= Gloable.shopGMOSeedsPrice:
		Gloable.bluePrice +=1
		Gloable.redPrice +=1
		Gloable.yellowPrice +=1
		Gloable.defaultBluePrice += 1
		Gloable.defaultRedPrice += 1
		Gloable.defaultYellowPrice += 1
		Gloable.fertalizerBluePrice += 2
		Gloable.fertalizerRedPrice += 2
		Gloable.fertalizerYellowPrice += 2
		Gloable.wallet -= Gloable.shopGMOSeedsPrice
		Gloable.shopGMOSeedsPrice += 100
		button.text = "BUY\n$" + str(Gloable.shopGMOSeedsPrice)
		SavingAndLoad.save_nodes()
