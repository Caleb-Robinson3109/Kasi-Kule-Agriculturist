extends Timer

@onready var collision_shape_2d = $"../CollisionShape2D"
@onready var timer_2 = $"."
@onready var garden = $".."

var yellowFlower = preload("res://yellow flower.tscn")
var redFlower = preload("res://red flower.tscn")
var blueFlower = preload("res://flower.tscn")

func _on_timeout():
	if(Gloable.numFlowers < Gloable.maxNumFlowers):
		#var randFlower = Gloable.flowersUsed[randi() % Gloable.flowersUsed.size()]
		var randFlower = Gloable.flowersNormal[randi() % Gloable.flowersNormal.size()]
		var flower = randFlower.instantiate()
		flower.position = Vector2(randf_range(collision_shape_2d.position.x + 470,
		collision_shape_2d.position.x - 470), 
		randi_range(collision_shape_2d.position.y - 75 ,collision_shape_2d.position.y + 75))
		garden.add_child(flower)
		Gloable.numFlowers = Gloable.numFlowers + 1
		timer_2.set_wait_time(randf_range(0,Gloable.spawnRate))

