extends CharacterBody2D

@onready var stall_mark = $stallMark
@onready var shopping_npc = $"."
@onready var back_mark = $backMark
@onready var shopping_timer = $shoppingTimer
@onready var begin_trip = $beginTrip
@onready var drop_off_buy_flowers = $drop_off_buy_flowers
@onready var retrun_timer = $"retrun timer"

@export var speed = 2
#var velocity = Vector2(0,0)
var pos1 = Vector2(0,0)
var pos2 = Vector2(0,0)
var pos1done = false
var doTimer = false
var wasPaused = false

func _ready():
	pos1 = Vector2(position.x, position.y)
	pos2 = Vector2(position.x, position.y)
	pos1 = stall_mark.global_position
	pos2 = back_mark.global_position
	
#pauses the animation when the pause screen is on
func _process(delta):
	if Menu.paused && Gloable.goShopping:
		Gloable.goShopping = false
		wasPaused = true
	if !Menu.paused && wasPaused:
		wasPaused = false
		Gloable.goShopping = true
	
func _physics_process(delta):
	shopping_npc.velocity = Vector2(0,0)
	if Gloable.goShopping:
		if !pos1done && shopping_npc.global_position.x > pos1.x:
			velocity.x = velocity.x - 1	
		elif !pos1done && shopping_npc.global_position.x + 1== pos1.x:
			pos1done = true
			doTimer = true
		elif pos1done && doTimer:
			doTimer = false
			Gloable.goShopping = false
			shopping_timer.set_wait_time(randf_range(1,3))
			shopping_timer.start()
		elif !doTimer && shopping_npc.global_position.x < pos2.x:
			velocity.x = velocity.x + 1
		elif shopping_npc.global_position.x == pos2.x:
			pos1done = false
			doTimer = false
			var NPCchildren = shopping_npc.get_children()
			var sprite = NPCchildren[1]
			sprite.animation = "default"
			Gloable.flowersInShop = 0
			Gloable.goShopping = false
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
			move_and_collide(velocity)

func save_node(save):
	save.shopper.position.x = shopping_npc.global_position.x
	save.shopper.position.y = shopping_npc.global_position.y
	if !begin_trip.is_stopped():
		save.shopper.timer = "beginTrip"
		save.shopper.time = begin_trip.time_left
	elif !shopping_timer.is_stopped():
		save.shopper.timer = "shoppingTimer"
		save.shopper.time = shopping_timer.time_left
	elif !drop_off_buy_flowers.is_stopped():
		save.shopper.timer = "drop_off_buy_flowers"
		save.drop_off_buy_flowers = begin_trip.time_left
	elif !retrun_timer.is_stopped():
		save.shopper.timer = "retrun timer"
		save.retrun_timer = begin_trip.time_left
	else:
		save.shopper.timer = "none"
		save.drop_off_buy_flowers = 0
	save.shopper.sprite = shopping_npc.find_child("AnimatedSprite2D").animation
	return save
	
func load_node(save):
	shopping_npc.global_position = Vector2(save.shopper.position.x, save.shopper.position.y)
	if save.shopper.timer == "none":
		pass
	elif save.shopper.timer == "beginTrip":
		begin_trip.start(save.shopper.time)
	elif save.shopper.timer == "shoppingTimer":
		shopping_timer.start(save.shopper.time)
	elif save.shopper.timer == "drop_off_buy_flowers":
		drop_off_buy_flowers.start(save.shopper.time)
	elif save.shopper.timer == "retrun timer":
		retrun_timer.start(save.shopper.time)
	else:
		pass
	shopping_npc.find_child("AnimatedSprite2D").animation = save.shopper.sprite
	
	
