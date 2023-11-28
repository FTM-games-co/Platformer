extends CanvasLayer

func _ready():
	set_it_visible(false)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		set_it_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
		print("Game Paused:", get_tree().paused)

func set_it_visible(is_visible):
	for node in get_children():
		node.visible = is_visible
	print("UI Visibility Set to:", is_visible)
