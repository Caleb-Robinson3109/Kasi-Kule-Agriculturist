extends Timer
@onready var tractor_timer = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	var tractorNode = get_node("tractor_power_up")
	tractorNode.startTractorTimer.connect(tractorTimerStart)
	
func tractorTimerStart():
	tractor_timer.start()

func _on_timeout():
	Gloable.hasTractor = false
