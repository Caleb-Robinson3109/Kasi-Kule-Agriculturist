extends Timer
@onready var seeds_time_out_timer = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(bool(Gloable.hasSeeds) == true):
		Gloable.hasSeeds = false
		Gloable.flowersUsed = Gloable.flowersSeeds
		Gloable.flowersUsedStr = "flowersSeeds"
		Gloable.doPowerupProgressBar = true
		seeds_time_out_timer.wait_time = Gloable.pupTime
		seeds_time_out_timer.start()


func _on_timeout():
	Gloable.flowersUsed = Gloable.flowersNormal
	Gloable.flowersUsedStr = "flowersNormal"
	SavingAndLoad.save_nodes()
