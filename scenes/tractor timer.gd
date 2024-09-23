extends Timer
@onready var tractor_power_up = $"../.."


func _on_timeout():
	Gloable.hasTractor = false
	tractor_power_up.queue_free()
