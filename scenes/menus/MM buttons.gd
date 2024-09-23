extends Control
@onready var key_board_button = $HBoxContainer/key_board_button
@onready var mouse_button = $HBoxContainer/mouse_button

var button_select = preload("res://themes/button_select.tres")
var button_unselect = preload("res://themes/button unselect.tres")


func _on_key_board_button_pressed():
	Gloable.movementMode = 1
	key_board_button.theme = button_select
	mouse_button.theme = button_unselect


func _on_mouse_button_pressed():
	Gloable.movementMode = 0
	key_board_button.theme = button_unselect
	mouse_button.theme = button_select
