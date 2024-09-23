extends Timer
@onready var retrun_timer = $"../retrun timer"
@onready var shopping_npc = $".."


func _on_timeout():
	#picks the flowers up
	var NPCchildren = shopping_npc.get_children()
	var sprite = NPCchildren[1]
	sprite.animation = "flower"
	retrun_timer.wait_time = randf_range(0.2,0.4)
	retrun_timer.start()
