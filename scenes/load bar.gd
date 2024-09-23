extends ProgressBar
@onready var timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	value = 1 - timer.time_left

