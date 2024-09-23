extends Timer
@onready var collision_shape_2d = $"../CollisionShape2D"

var blueFlower = preload("res://flower.tscn")
var redFlower = preload("res://red flower.tscn")
var yellowFlower = preload("res://yellow flower.tscn")
var numFlowers = 0

func _on_Timer_timeout():
	print(numFlowers)
	randomize()
	var flowers = [blueFlower, redFlower, yellowFlower]
	var randFlower = flowers[randi() % flowers.size()]
	var flower = randFlower.instantiate()
	flower.position = Vector2(randi_range(collision_shape_2d.position.x - 400,
	collision_shape_2d.position.x + 400), randi_range(collision_shape_2d.position.y,collision_shape_2d.position.y + 200))
	add_child(flower)
	numFlowers = numFlowers + 1
	wait_time = randf_range(0,1)
	
