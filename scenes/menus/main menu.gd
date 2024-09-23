extends Button
@onready var settings = $"../../../../.."


func _on_pressed():
	if Menu.lastScreen == "mm":
		SavingAndLoad.save_nodes()
		get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
	elif Menu.lastScreen == "pm":
		SavingAndLoad.save_nodes()
		Engine.time_scale = 1
		get_tree().change_scene_to_file("res://saved_main.tscn")
		#get_tree().change_scene_to_file("res://main.tscn")
	else:
		SavingAndLoad.save_nodes()
		get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
