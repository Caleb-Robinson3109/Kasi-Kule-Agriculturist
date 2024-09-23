extends Node2D
@onready var canvas_modulate = $CanvasModulate


@export var col = false
var sixth = 1
var red = 0
var green = 0
var blue = 255
@onready var timer = $CanvasModulate/Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	col = Gloable.colorFlower
	if col:
		canvas_modulate.color = Color8(0,0, 255, 255)
		timer.start()
	else:
		canvas_modulate.color = Color8(247,206, 28, 255)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func colorMe():
	if sixth == 1:
		red += 1
		canvas_modulate.color = Color8(red, green, blue, 255)
		if red == 255:
			sixth = 2
	elif sixth == 2:
		blue -= 1
		canvas_modulate.color = Color8(red, green, blue, 255)
		if blue == 0:
			sixth = 3
	elif sixth == 3:
		green += 1
		canvas_modulate.color = Color8(red, green, blue, 255)
		if green == 255:
			sixth = 4
	elif sixth == 4:
		red -= 1
		canvas_modulate.color = Color8(red, green, blue, 255)
		if red == 0:
			sixth = 5
	elif sixth == 5:
		blue += 1
		canvas_modulate.color = Color8(red, green, blue, 255)
		if blue == 255:
			sixth = 6
	elif sixth == 6:
		green -= 1
		canvas_modulate.color = Color8(red, green, blue, 255)
		if green == 0:
			sixth = 1
		


func _on_timer_timeout():
	if col:
		colorMe()
