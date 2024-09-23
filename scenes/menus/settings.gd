extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("escape"):
		if Menu.lastScreen == "mm":
			SavingAndLoad.save_nodes()
			get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
		elif Menu.lastScreen == "pm":
			SavingAndLoad.save_nodes()
			get_tree().change_scene_to_file("res://saved_main.tscn")
			#get_tree().change_scene_to_file("res://main.tscn")
		else:
			SavingAndLoad.save_nodes()
			get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
