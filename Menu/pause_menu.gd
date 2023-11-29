extends CanvasLayer

func _ready():
	self.visible = false
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		check_pause()

func check_pause():
	var scene_tree = get_tree()

	if scene_tree.paused:
		scene_tree.set_pause(false)
		self.visible = false
	else:
		scene_tree.set_pause(true)
		self.visible = true

func _on_resume_pressed():
	check_pause()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	check_pause()
