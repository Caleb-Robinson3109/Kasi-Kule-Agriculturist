extends Area2D

func _on_powerUp():
	Gloable.hasTractor = true
	Gloable.onScreenPup = false
	queue_free()

func _process(_delta):
	if Gloable.powerUpRange:
		_on_powerUp()

