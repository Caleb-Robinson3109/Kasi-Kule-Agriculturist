extends Button
@onready var pause_menu = $"../../.."

func _on_pressed():
	pause_menu.hide()
	Engine.time_scale = 1
	Menu.paused = !Menu.paused
