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
	var uicanvas = find_child("UI_canvas", true, false)
	_is_paused = false
	uicanvas.visible = true
	clickeffect.play()
	print("resumed")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_pause_pressed():
	var uicanvas = find_child("UI_canvas", true, false)
	_is_paused = true
	uicanvas.visible = false
	print("paused")
