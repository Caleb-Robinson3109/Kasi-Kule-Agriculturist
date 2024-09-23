extends Area2D

@onready var upgrade_shop = $"Upgrade Shop"
@onready var seller_hitbox = $"seller hitbox"

func _on_body_entered(body):
	if body != seller_hitbox:
		upgrade_shop.get_node("ani").play("transIn")
		Gloable.lastAniShop = "in"
	


func _on_body_exited(body):
	
	if upgrade_shop.get_node("ani").is_playing():
		if Gloable.lastAniShop != "out":
			upgrade_shop.get_node("ani").queue("transOut")
			upgrade_shop.get_node("Panel/MarginContainer/ScrollContainer").scroll_vertical = 0
			Gloable.lastAniShop = "out"
	else:
		if Gloable.lastAniShop != "out":
			upgrade_shop.get_node("ani").play("transOut")
			upgrade_shop.get_node("Panel/MarginContainer/ScrollContainer").scroll_vertical = 0
			Gloable.lastAniShop = "out"
			
