extends CanvasLayer

var _is_paused:bool = false:
	set(value):
		_is_paused = value
		get_tree().paused = _is_paused
		visible = _is_paused

func _unhandled_input(event: InputEvent) -> void:
	var uicanvas = find_child("UI_canvas", true, false)
	if event.is_action_pressed("ui_cancel"):
		_is_paused = true
		uicanvas.visible = false
		print("paused")
		
"""
unc _unhandled_input(event: InputEvent) -> void:
	var uicanvas = find_child("UI_canvas", true, false)
	if event.is_action_pressed("ui_cancel"):
		if _is_paused:
			_is_paused = false
			uicanvas.visible = true
			print("resumed")
		else:
			_is_paused = true
			uicanvas.visible = false
			print("paused")
"""		
		
func _on_resume_pressed() -> void:
	var uicanvas = find_child("UI_canvas", true, false)
	_is_paused = false
	uicanvas.visible = true
	print("resumed")

func _on_quit_pressed() -> void:
	get_tree().quit()
