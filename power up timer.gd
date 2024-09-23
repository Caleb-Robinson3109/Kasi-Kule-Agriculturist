extends Timer
#timer that on timeout the powerup spawns
@onready var power_up_timer = $"."
#the powerup will spawn in the middle of this collision shape
@onready var collision_shape_2d = $"../CollisionShape2D"

var pupTractor = preload("res://scenes/tractor_power_up.tscn")
var pupFertalizer = preload("res://scenes/fertalizer_power_up.tscn")
var pupWateringCan = preload("res://scenes/watering_can_power_up.tscn")
var pupPitchFork = preload("res://scenes/pitch_fork_power_up.tscn")
var pupSeeds = preload("res://scenes/seeds_power_up.tscn")
var pups = [pupTractor, pupFertalizer, pupWateringCan, pupPitchFork, pupSeeds]



func _on_timeout():
	#has bought a roll the dice
	if Gloable.dice.size() > 0:
		if Gloable.dice[0] == "tractor":
			Gloable.dice.pop_front()
			var randPup = pupTractor
			var pup = randPup.instantiate()
			pup.position = Vector2(collision_shape_2d.global_position.x, collision_shape_2d.global_position.y)
			add_child(pup)
			power_up_timer.set_wait_time(randf_range(Gloable.pupTime + 10 , Gloable.pupTime + 23))
		elif Gloable.dice[0] == "fertalizer":
			Gloable.dice.pop_front()
			var randPup = pupFertalizer
			var pup = randPup.instantiate()
			pup.position = Vector2(collision_shape_2d.global_position.x, collision_shape_2d.global_position.y)
			add_child(pup)
			power_up_timer.set_wait_time(randf_range(Gloable.pupTime + 10 , Gloable.pupTime + 23))
		elif Gloable.dice[0] == "pitchFork":
			Gloable.dice.pop_front()
			var randPup = pupPitchFork
			var pup = randPup.instantiate()
			pup.position = Vector2(collision_shape_2d.global_position.x, collision_shape_2d.global_position.y)
			add_child(pup)
			power_up_timer.set_wait_time(randf_range(Gloable.pupTime + 10 , Gloable.pupTime + 23))
		elif Gloable.dice[0] == "seeds":
			Gloable.dice.pop_front()
			var randPup = pupSeeds
			var pup = randPup.instantiate()
			pup.position = Vector2(collision_shape_2d.global_position.x, collision_shape_2d.global_position.y)
			add_child(pup)
			power_up_timer.set_wait_time(randf_range(Gloable.pupTime + 10 , Gloable.pupTime + 23))
		elif Gloable.dice[0] == "wateringCan":
			Gloable.dice.pop_front()
			var randPup = pupWateringCan
			var pup = randPup.instantiate()
			pup.position = Vector2(collision_shape_2d.global_position.x, collision_shape_2d.global_position.y)
			add_child(pup)
			power_up_timer.set_wait_time(randf_range(Gloable.pupTime + 10 , Gloable.pupTime + 23))
	else:
		var randPup = pups[randi() % pups.size()]
		#var randPup = pupSeeds
		var pup = randPup.instantiate()
		pup.position = Vector2(collision_shape_2d.global_position.x, collision_shape_2d.global_position.y)
		add_child(pup)
		power_up_timer.set_wait_time(randf_range(Gloable.pupTime + 10 , Gloable.pupTime + 23))
