extends CanvasLayer
var wineffect = WinEffect
var clickeffect = ClickEffect

func _ready():
	wineffect.play()

func _on_retry_pressed():
	Game.switch_to_previous_scene()
	clickeffect.play()
	
func _on_next_pressed():
	get_tree().change_scene_to_file("res://Menu/Level_selection/level_select.tscn")
	clickeffect.play()
