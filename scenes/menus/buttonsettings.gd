extends Button

@onready var pause_menu = $"../../.."
#var settings = preload("res://scenes/menus/settings.tscn")

func _on_pressed():
	Menu.lastScreen = "pm"

	SavingAndLoad.save_nodes()
	
	get_tree().change_scene_to_file("res://scenes/menus/settings.tscn")
