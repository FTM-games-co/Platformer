extends CanvasLayer
var deathsoundeffect = DeathSoundEffect
var clickeffect = ClickEffect

func _ready():
	deathsoundeffect.play()

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")
	clickeffect.play()
	
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	clickeffect.play()
