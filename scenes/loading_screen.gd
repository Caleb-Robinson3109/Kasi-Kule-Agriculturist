extends Control
@onready var timer = $ColorRect/VBoxContainer/ProgressBar/Timer

func loading():
	Gloable.speed = 0.0
	timer.start(1)


func _on_timer_timeout():
	SavingAndLoad.load_nodes()
	visible = false
	Gloable.speed = 500.0
