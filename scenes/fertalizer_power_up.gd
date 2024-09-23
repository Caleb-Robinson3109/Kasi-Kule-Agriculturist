extends Area2D

func _on_powerUp():
	Gloable.hasFertalizer = true
	Gloable.onScreenPup = false
	queue_free()

#func _ready():
#	var stall = get_node("../selling area")
#	stall.connect("powerUp", _on_powerUp)

func _process(_delta):
	if Gloable.powerUpRange:
		_on_powerUp()
