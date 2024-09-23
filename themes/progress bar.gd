extends Control
@onready var progressBar = $"."

func save_node(save):
	save.progress_bar.timer = progressBar.find_child("bar_timer").time_left
	return save
	
func load_node(save):
	progressBar.find_child("bar_timer").wait_time = save.progress_bar.timer
	if save.progress_bar.timer > 0:
		progressBar.show()
		progressBar.find_child("bar_timer").start()
