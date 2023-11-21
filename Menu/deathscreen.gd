extends Label
var clickeffect = ClickEffect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/level_test.tscn")
	clickeffect.play()


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	clickeffect.play()
