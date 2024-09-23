extends Button

@onready var garden = $"../garden"


func _on_pressed():
	SavingAndLoad.save_nodes()
	print("saving")
	var children = garden.get_children()
	for node in children:
		if node.name != "CollisionShape2D" && node.name != "Timer2":
			node.queue_free()
	
