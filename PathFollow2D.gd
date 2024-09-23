extends PathFollow2D

@onready var path_follow_2d = $"."
@export var speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_h_offset(get_h_offset() + speed * delta)
