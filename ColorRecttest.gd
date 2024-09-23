extends ColorRect

var sixth = 1
var red = 0
var green = 0
var blue = 255
# Called when the node enters the scene tree for the first time.
func _ready():
	color = Color8(red,green,blue,55)


func _process(delta):
	print(color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func colormake():
	if sixth == 1:
		print("1")
		if red == 0:
			red = 15
			color = Color8(red, green, blue, 55)
		else:
			red += 8
			color = Color8(red, green, blue, 55)
			if red == 255:
				sixth = 2
	elif sixth == 2:
		print("2")
		if blue == 15:
			blue = 0
			color = Color8(red, green, blue, 55)
			sixth = 3
		else:
			blue -= 16
			color = Color8(red, green, blue, 55)
	elif sixth == 3:
		print("3")
		if green == 0:
			green = 15
			color = Color8(red, green, blue, 55)
		else:
			green += 16
			color = Color8(red, green, blue, 55)
			if green == 255:
				sixth = 4
	elif sixth == 4:
		print("4")
		if red == 15:
			red = 0
			color = Color8(red, green, blue, 55)
			sixth = 5
		else:
			red -= 16
			color = Color8(red, green, blue, 55)
	elif sixth == 5:
		print("5")
		if blue == 0:
			blue = 15
			color = Color8(red, green, blue, 55)
			print("15")
		else:
			print(str(color.g))
			blue += 16
			color = Color8(red, green, blue, 55)
			if blue == 255:
			
				sixth = 6
	elif sixth == 6:
		print("6")
		if green == 15:
			green = 0
			color = Color8(red, green, blue, 55)
			sixth = 1
		else:
			green -= 16
			color = Color8(red, green, blue, 55)


func _on_color_timeout():
	colormake()
	
