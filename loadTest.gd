extends Button

func _on_pressed():
	SavingAndLoad.load_nodes()
	print("loading")
