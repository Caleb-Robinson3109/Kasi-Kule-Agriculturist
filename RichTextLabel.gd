extends RichTextLabel
@onready var rich_text_label = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	rich_text_label.add_text("Bag: " + str(Gloable.bagUsed) + " / " + str(Gloable.bagSize) + "\tMoney: $" + str(Gloable.wallet))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rich_text_label.clear()
	rich_text_label.add_text("Bag: " + str(Gloable.bagUsed) + " / " + str(Gloable.bagSize) + "\tMoney: $" + str(Gloable.wallet))
