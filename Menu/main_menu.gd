extends Node2D

var backgroundmusic = BackGroundMusic
var clickeffect = ClickEffect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Levels/level_test.tscn")
	clickeffect.play()

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Menu/options.tscn")
	clickeffect.play()

func _on_quit_pressed():
	get_tree().quit()
	clickeffect.play()

func _on_music_toggled(button_pressed):
	if button_pressed:
		backgroundmusic.play()
	else:
		backgroundmusic.stop()
