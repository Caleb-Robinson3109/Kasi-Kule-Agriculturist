extends Timer
@onready var pitch_fork_power_up = $".."



func _on_timeout():
	pitch_fork_power_up.queue_free()
