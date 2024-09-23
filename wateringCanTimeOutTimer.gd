extends Timer
@onready var watering_can_time_out_timer = $"."


func _process(delta):
	if(bool(Gloable.hasWateringCan) == true):
		Gloable.hasWateringCan = false
		Gloable.spawnRate = Gloable.wateringCanSpawnRate
		Gloable.doPowerupProgressBar = true
		watering_can_time_out_timer.wait_time = Gloable.pupTime
		watering_can_time_out_timer.start()



	


func _on_timeout():
	Gloable.spawnRate = Gloable.defaultSpawnRate
	SavingAndLoad.save_nodes()
