extends CanvasLayer


func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")
	
func _on_next_pressed():
	get_tree().change_scene_to_file("res://Menu/Level_selection/level_select.tscn")
