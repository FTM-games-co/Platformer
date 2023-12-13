extends Node2D
var clickeffect = ClickEffect
var backgroundmusic = BackGroundMusic

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Menu/main_menu.tscn")

func _on_fullscreen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if button_pressed == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_music_toggled(button_pressed):
	if button_pressed:
		backgroundmusic.volume_db = -15
	else:
		backgroundmusic.volume_db = -80
