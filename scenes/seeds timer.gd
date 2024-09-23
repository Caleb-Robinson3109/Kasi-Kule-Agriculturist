extends Timer
@onready var seeds_power_up = $".."

func _on_timeout():
	seeds_power_up.queue_free()
