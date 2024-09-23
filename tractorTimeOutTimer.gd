extends Node
@onready var tractor_time_out_timer = $"."
@onready var sprite_2d = $"../Sprite2D"
@onready var default_collision = $"../default collision"
@onready var tractor_collision = $"../tractor collision"

func _process(delta):
	if(bool(Gloable.hasTractor) == true):
		Gloable.hasTractor = 0
		sprite_2d.animation = "tractor"
		default_collision.disabled = true
		tractor_collision.disabled = false
		Gloable.speed = Gloable.tractorSpeed
		Gloable.doPowerupProgressBar = true
		tractor_time_out_timer.wait_time = Gloable.pupTime
		tractor_time_out_timer.start()
	
func _on_timeout():
	Gloable.speed = Gloable.defaultSpeed
	sprite_2d.animation = "default"
	default_collision.disabled = false
	tractor_collision.disabled = true
	SavingAndLoad.save_nodes()
