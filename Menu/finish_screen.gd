extends CanvasLayer
var wineffect = WinEffect
var clickeffect = ClickEffect

func _ready():
	wineffect.play()

func _on_retry_pressed():
	clickeffect.play()
	Game.switch_to_previous_scene()
	
func _on_next_pressed():
	clickeffect.play()
	get_tree().change_scene_to_file("res://Menu/Level_selection/level_select.tscn")
