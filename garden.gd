extends StaticBody2D
@onready var gardenNode = $"."
var json = JSON.new()

var blue_flower = preload("res://flower.tscn")
var red_flower = preload("res://red flower.tscn")
var yellow_flower = preload("res://yellow flower.tscn")


func save_node(save):
	#resets the gareden
	save.garden.clear()
	var children = gardenNode.get_children()
	Gloable.numFlowers = 0
	for node in children:
		if node.name != "CollisionShape2D" && node.name != "Timer2":
			var file = FileAccess.open("res://save/default_flower.json", FileAccess.READ)
			var flower_json = json.parse_string(file.get_as_text())
			flower_json.flower_data.name = node.name
			flower_json.flower_data.type = node.type
			flower_json.flower_data.position.x = node.global_position.x
			flower_json.flower_data.position.y = node.global_position.y
			save.garden.push_back(flower_json)
			Gloable.numFlowers += 1
	return save
	
func load_node(save):
	for flower_json in save.garden:
		if flower_json.flower_data.type == "blue":
			var flower = blue_flower.instantiate()
			flower.name = flower_json.flower_data.name
			flower.type = "blue"
			flower.global_position = Vector2(flower_json.flower_data.position.x, flower_json.flower_data.position.y)
			gardenNode.add_child(flower)
		elif flower_json.flower_data.type == "red":
			var flower = red_flower.instantiate()
			flower.name = flower_json.flower_data.name
			flower.type = "red"
			flower.global_position = Vector2(flower_json.flower_data.position.x, flower_json.flower_data.position.y)
			gardenNode.add_child(flower)
		elif flower_json.flower_data.type == "yellow":
			var flower = yellow_flower.instantiate()
			flower.name = flower_json.flower_data.name
			flower.type = "yellow"
			flower.global_position = Vector2(flower_json.flower_data.position.x, flower_json.flower_data.position.y)
			gardenNode.add_child(flower)
		else:
			pass
