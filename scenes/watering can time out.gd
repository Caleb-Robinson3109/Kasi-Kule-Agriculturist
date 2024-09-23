extends Timer
@onready var watering_can_power_up = $".."

func _on_timeout():
	watering_can_power_up.queue_free()
