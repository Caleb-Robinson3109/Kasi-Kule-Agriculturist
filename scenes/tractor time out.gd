extends Timer
@onready var tractor_power_up = $".."

func _on_timeout():
	tractor_power_up.queue_free()
