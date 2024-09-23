extends Timer

@onready var shopping_npc = $".."
@onready var drop_off_buy_flowers = $"../drop_off_buy_flowers"
@onready var power_up_area = $"../../stall/power up area"
@onready var stall = $"../../stall"


var pupTractor = preload("res://scenes/tractor_power_up.tscn")
var pupFertalizer = preload("res://scenes/fertalizer_power_up.tscn")
var pupWateringCan = preload("res://scenes/watering_can_power_up.tscn")
var pupPitchFork = preload("res://scenes/pitch_fork_power_up.tscn")
var pupSeeds = preload("res://scenes/seeds_power_up.tscn")
var pups = [pupTractor, pupFertalizer, pupWateringCan, pupPitchFork, pupSeeds]

func _on_timeout():
	#places the powerup on the table
	var NPCchildren = shopping_npc.get_children()
	var sprite = NPCchildren[1]
	var pup = null
	if Gloable.powerUp == "fertalizer":
		var nextPup = pupFertalizer
		pup = nextPup.instantiate()
		Gloable.powerUp = ""
	elif Gloable.powerUp == "pitchFork":
		var nextPup = pupPitchFork
		pup = nextPup.instantiate()
		Gloable.powerUp = ""
	elif Gloable.powerUp == "tractor":
		var nextPup = pupTractor
		pup = nextPup.instantiate()
		Gloable.powerUp = ""
	elif Gloable.powerUp == "seeds":
		var nextPup = pupSeeds
		pup = nextPup.instantiate()
		Gloable.powerUp = ""
	elif Gloable.powerUp == "wateringCan":
		var nextPup = pupWateringCan
		pup = nextPup.instantiate()
		Gloable.powerUp = ""
	else:
		var nextPup = pups[randi() % pups.size()]
		pup = nextPup.instantiate()
	pup.position = power_up_area.global_position 
	stall.add_child(pup)
	Gloable.onScreenPup = true
	sprite.animation = "default"
	drop_off_buy_flowers.wait_time = randf_range(0.4, 0.9)
	drop_off_buy_flowers.start()
