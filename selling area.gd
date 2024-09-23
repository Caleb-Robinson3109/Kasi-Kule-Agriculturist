extends Area2D

#emits when there is a powerup and the pleyer enters the sell zone
#signal powerUp

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	var lotSoldPrice = (Gloable.blueInInventory * Gloable.bluePrice) + (Gloable.redInInventory * Gloable.redPrice) + (Gloable.yellowInInventory * Gloable.yellowPrice)
	Gloable.totalSold = Gloable.totalSold + lotSoldPrice
	Gloable.wallet = Gloable.wallet + lotSoldPrice
	Gloable.flowersInShop = Gloable.flowersInShop + Gloable.blueInInventory + Gloable.redInInventory + Gloable.yellowInInventory
	Gloable.blueInInventory = 0
	Gloable.redInInventory = 0
	Gloable.yellowInInventory = 0
	Gloable.bagUsed = 0
	if body.name == "player":
		Gloable.powerUpRange = true
		


func _on_body_exited(body):
	if body.name == "player":
		Gloable.powerUpRange = false
