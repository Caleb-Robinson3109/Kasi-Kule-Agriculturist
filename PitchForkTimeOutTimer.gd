extends Timer
@onready var pitch_fork_time_out_timer = $"."

#ery frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(bool(Gloable.hasPitchFork) == true):
		Gloable.hasPitchFork = false
		Gloable.maxNumFlowers = Gloable.maxNumFlowers + Gloable.pitchForkMaxNumFlowers
		Gloable.doPowerupProgressBar = true
		pitch_fork_time_out_timer.wait_time = Gloable.pupTime
		pitch_fork_time_out_timer.start()


func _on_timeout():
	Gloable.maxNumFlowers = Gloable.maxNumFlowers - Gloable.pitchForkMaxNumFlowers
	SavingAndLoad.save_nodes()
