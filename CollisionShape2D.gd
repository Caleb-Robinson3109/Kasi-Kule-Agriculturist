extends CollisionShape2D
@onready var collision_shape_2d = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	var intr = collision_shape_2d.get_s



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
