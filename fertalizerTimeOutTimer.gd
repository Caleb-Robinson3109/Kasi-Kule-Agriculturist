extends Timer
@onready var fertalizer_time_out_timer = $"."

func _process(delta):
	if(bool(Gloable.hasFertalizer) == true):
		Gloable.hasFertalizer = false
		Gloable.bluePrice = Gloable.fertalizerBluePrice
		Gloable.redPrice = Gloable.fertalizerRedPrice
		Gloable.yellowPrice = Gloable.fertalizerYellowPrice
		Gloable.doPowerupProgressBar = true
		fertalizer_time_out_timer.wait_time = Gloable.pupTime
		fertalizer_time_out_timer.start()



func _on_timeout():
	Gloable.bluePrice = Gloable.defaultBluePrice
	Gloable.redPrice = Gloable.defaultRedPrice
	Gloable.yellowPrice = Gloable.defaultYellowPrice
	SavingAndLoad.save_nodes()
