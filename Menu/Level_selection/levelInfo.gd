extends Label


func _process(delta):
	text = "YOU MUST BEAT LEVEL " + str(Game.progress) + " FIRST"
