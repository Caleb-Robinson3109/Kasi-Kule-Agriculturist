extends Control
@onready var v_box_container = $VBoxContainer
@onready var play = $play
var playSize

func _ready():
	playSize = "grow"

func _process(delta):
	if playSize == "grow":
		play.scale.x = play.scale.x + 0.01
		play.scale.y = play.scale.y + 0.01
		if play.scale.x > 1.5:
			playSize = "shrink"
	else:
		play.scale.x = play.scale.x - 0.01
		play.scale.y = play.scale.y - 0.01
		if play.scale.x < 0.8:
			playSize = "grow"
	


#func _on_save_3_pressed():
#	SavingAndLoad.path = "user://save3.json"
#	SavingAndLoad.save3_name = "Save 3"
#	SavingAndLoad.save3_used = true
#	Engine.time_scale = 1
#	get_tree().change_scene_to_file("res://main.tscn")




func _on_play_pressed():
	SavingAndLoad.path = "user://save.json"
	SavingAndLoad.save_name = "save"
#	SavingAndLoad.save3_used = true
#	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://main.tscn")
