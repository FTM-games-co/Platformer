extends CanvasLayer

func _ready():
	self.visible = false
	#set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		self.visible = true

func resume():
	self.visible = false

func _on_resume_pressed():
	resume()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
