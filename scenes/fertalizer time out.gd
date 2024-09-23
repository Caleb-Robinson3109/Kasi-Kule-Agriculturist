extends Timer
@onready var fertalizer_power_up = $".."

func _on_timeout():
	fertalizer_power_up.queue_free()
