extends Node

var json = JSON.new()
var path = "user://data.json"
var save_name = "Empty"
var save_used = false

func save_nodes():
	var save_nodes = get_tree().get_nodes_in_group("save_group")
	var save = read_save()
	for node in save_nodes:
		save = node.save_node(save)
	write_save(save)


func load_nodes():
	var load_nodes = get_tree().get_nodes_in_group("save_group")
	for node in load_nodes:
		node.load_node(read_save())
	
func write_save(content):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(json.stringify(content))
	file.close()
	file = null

func read_save():
	var file = FileAccess.open(path, FileAccess.READ)
	var content = json.parse_string(file.get_as_text())
	return content
	
func create_new_save_file():
	var file
	var content
	if FileAccess.file_exists(path):
		file = FileAccess.open(path, FileAccess.READ)
		content = json.parse_string(file.get_as_text())
	else:
		#reads default json
		file = FileAccess.open("res://save/default.json", FileAccess.READ)
		content = json.parse_string(file.get_as_text())
		#makes the new game save
		var new_save = FileAccess.open(path, FileAccess.WRITE_READ)
		new_save.close()
		var default_save = FileAccess.open("res://save/default.json", FileAccess.READ)
		var default_content = json.parse_string(default_save.get_as_text())
		new_save = FileAccess.open(path, FileAccess.WRITE)
		new_save.store_string(json.stringify(default_content))
		new_save.close()
		
	return content
	
