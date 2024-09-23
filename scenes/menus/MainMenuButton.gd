extends Button

@onready var pause_menu = $"../../.."

func _on_main_menu_pressed():
	SavingAndLoad.save_nodes()
	pause_menu.hide()
	Engine.time_scale = 1
	Menu.paused = !Menu.paused
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
