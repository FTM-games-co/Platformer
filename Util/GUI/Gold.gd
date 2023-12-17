extends Label

func _process(_delta):
	text = "Coins: " + str(Game.playerGold)
