extends CanvasLayer

#var _is_paused:bool = false:
#	set = set_paused

var _is_paused:bool = false:
	set(value):
		_is_paused = value
		get_tree().paused = _is_paused
		visible = _is_paused


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_is_paused = !_is_paused


func set_paused(value:bool) -> void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused

func _on_resume_pressed() -> void:
	_is_paused = false
	

func _on_main_menu_pressed() -> void:
	_is_paused = false
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	
