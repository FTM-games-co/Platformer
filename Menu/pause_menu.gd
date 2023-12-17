extends CanvasLayer
var clickeffect = ClickEffect

var _is_paused:bool = false:
	set(value):
		_is_paused = value
		get_tree().paused = _is_paused
		visible = _is_paused

func _input(event: InputEvent) -> void:
	var uicanvas = find_child("UI_canvas", true, false)
	if event.is_action_pressed("ui_cancel"):
		_is_paused = true
		uicanvas.visible = false
		print("paused")
	if event.is_action_pressed("ui_accept") and _is_paused:
		_is_paused = false
		uicanvas.visible = true
		print("unpaused")
		
func _on_resume_pressed() -> void:
	clickeffect.play()
	var uicanvas = find_child("UI_canvas", true, false)
	_is_paused = false
	uicanvas.visible = true
	print("resumed")

func _on_pause_pressed():
	var uicanvas = find_child("UI_canvas", true, false)
	_is_paused = true
	uicanvas.visible = false
	print("paused")

func _on_fullscreen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if button_pressed == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func _on_menu_pressed():
	clickeffect.play()
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	_is_paused = false
	print("back at main menu")

func _on_quit_pressed():
	get_tree().quit()
	print("exited")
