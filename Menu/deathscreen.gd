extends Label
var clickeffect = ClickEffect
var deathmusic = DeathMusic
var backgroundmusic = BackGroundMusic

# Called when the node enters the scene tree for the first time.
func _ready():
	backgroundmusic.stop()
	deathmusic.play()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/level_test.tscn")
	Game.playerHealth = 5
	Game.playerGold = 0
	clickeffect.play()
	deathmusic.stop()
	backgroundmusic.play()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	Game.playerHealth = 5
	Game.playerGold = 0
	clickeffect.play()
	deathmusic.stop()
	backgroundmusic.play()
