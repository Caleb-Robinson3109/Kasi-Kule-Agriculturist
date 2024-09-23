extends StaticBody2D
@onready var stall = $"."
@onready var power_up_area = $"power up area"

var fertalizer = preload("res://scenes/fertalizer_power_up.tscn")
var pitch_fork = preload("res://scenes/pitch_fork_power_up.tscn")
var seeds = preload("res://scenes/seeds_power_up.tscn")
var tractor = preload("res://scenes/tractor_power_up.tscn")
var watering_can = preload("res://scenes/watering_can_power_up.tscn")

func save_node(save):
	#gets the power up that is on the table if not then it remains none
	var stall_children = stall.get_children()
	for child in stall_children:
		if child.name != "stall texture" && child.name != "power up area" && child.name != "stall hitBox" && child.name != "selling area":
			save.stall_power_up.type = child.name
			save.stall_power_up.time = child.find_child("time_out").time_left
		else:
			save.stall_power_up.type = "none"
			save.stall_power_up.time = "0"
	return save
	
func load_node(save):
	if save.stall_power_up.type != "none":
		if save.stall_power_up.type == "fertalizer power up":
			var power_up = fertalizer.instantiate()
			power_up.find_child("time_out").wait_time = save.stall_power_up.time
			power_up.position = power_up_area.global_position 
			stall.add_child(power_up)
		elif  save.stall_power_up.type == "pitch fork power up":
			var power_up = pitch_fork.instantiate()
			power_up.find_child("time_out").wait_time = save.stall_power_up.time
			power_up.position = power_up_area.global_position 
			stall.add_child(power_up)
		elif  save.stall_power_up.type == "seeds power up":
			var power_up = seeds.instantiate()
			power_up.find_child("time_out").wait_time = save.stall_power_up.time
			power_up.position = power_up_area.global_position 
			stall.add_child(power_up)
		elif  save.stall_power_up.type == "tractor power up":
			var power_up = tractor.instantiate()
			power_up.find_child("time_out").wait_time = save.stall_power_up.time
			power_up.position = power_up_area.global_position 
			stall.add_child(power_up)
		elif  save.stall_power_up.type == "watering can power up":
			var power_up = watering_can.instantiate()
			power_up.find_child("time_out").wait_time = save.stall_power_up.time
			power_up.position = power_up_area.global_position 
			stall.add_child(power_up)
		else:
			pass
