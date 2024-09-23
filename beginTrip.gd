extends Timer

@onready var begin_trip = $"."
@onready var shopping_npc = $".."

var pups = ["tractor", "fertalizer", "wateringCan", "pitchFork", "seeds"]



func _on_timeout():
	var NPCchildren = shopping_npc.get_children()
	var sprite = NPCchildren[1]
	if Gloable.flowersInShop > 0:
		#caculates what power up will be used
		#has bought a roll the dice
		if Gloable.dice.size() > 0:
			if Gloable.dice[0] == "tractor":
				sprite.animation = "tractor"
				Gloable.powerUp = "tractor"
			elif Gloable.dice[0] == "fertalizer":
				Gloable.powerUp = "fertalizer"
				sprite.animation = "fertalizer"
			elif Gloable.dice[0] == "pitchFork":
				Gloable.powerUp = "pitchFork"
				sprite.animation = "pitchFork"
			elif Gloable.dice[0] == "seeds":
				Gloable.powerUp = "seeds"
				sprite.animation = "seeds"
			elif Gloable.dice[0] == "wateringCan":
				Gloable.powerUp = "wateringCan"
				sprite.animation = "wateringCan"
			Gloable.dice.pop_front()
		else:
			Gloable.powerUp = pups[randi() % pups.size()]
			sprite.animation = Gloable.powerUp
		
		Gloable.goShopping = true
		begin_trip.set_wait_time(randf_range(17 + Gloable.pupTime,25 + Gloable.pupTime))
		begin_trip.start()
	else:
		begin_trip.set_wait_time(randf_range(17 + Gloable.pupTime,25 + Gloable.pupTime))
		begin_trip.start()
