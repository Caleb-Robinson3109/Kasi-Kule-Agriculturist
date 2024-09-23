extends Timer
@onready var control = $"../.."
@onready var progress_bar = $".."
@onready var timer = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_bar.value = timer.time_left
	if(bool(Gloable.doPowerupProgressBar) == true):
		Gloable.doPowerupProgressBar = false
		timer.wait_time = Gloable.pupTime
		progress_bar.max_value = Gloable.pupTime
		progress_bar.value = Gloable.pupTime
		control.visible = true
		timer.start()


func _on_timeout():
	control.visible = false
