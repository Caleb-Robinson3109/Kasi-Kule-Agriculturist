extends Button

@onready var garden = $".."



func _on_pressed():
	var children = garden.get_children()
	for i in children:
		if i.name != "CollisionShape2D" && i.name != "Timer2" && i.name != "Button":
			print(str(i.type) + " - " + str(i.global_position))
