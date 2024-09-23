extends Area2D
@export var type = "yellow"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if Gloable.bagSize > Gloable.bagUsed:
		queue_free()
		Gloable.numFlowers = Gloable.numFlowers - 1
		Gloable.yellowInInventory = Gloable.yellowInInventory + 1
		Gloable.bagUsed += 1
