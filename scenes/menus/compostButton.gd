extends Button
@onready var button = $"."
var greenButton = preload("res://themes/button_green.tres")
var redButton = preload("res://themes/button_red.tres")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Gloable.wallet < Gloable.shopCompostPrice || Gloable.shopCompostPrice > 2000:
		button.theme = redButton
	else:
		button.theme = greenButton


func _on_pressed():
	if Gloable.wallet >= Gloable.shopCompostPrice && Gloable.shopCompostPrice <= 2000:
		Gloable.spawnRate -= 0.25
		Gloable.defaultSpawnRate -= 0.25
		Gloable.wallet -= Gloable.shopCompostPrice
		Gloable.shopCompostPrice += 100
		if Gloable.shopCompostPrice > 2000:
			button.text = "MAX"
		else:
			button.text = "BUY\n$" + str(Gloable.shopCompostPrice)
		SavingAndLoad.save_nodes()
