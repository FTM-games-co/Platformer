extends CanvasLayer
var deathsoundeffect = DeathSoundEffect
var clickeffect = ClickEffect

func _ready():
	deathsoundeffect.play()

func _on_retry_pressed():
	clickeffect.play()
	Game.switch_to_previous_scene()
	
	
func _on_menu_pressed():
	clickeffect.play()
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
