extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Levels/level_test.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Menu/options.tscn")


func _on_quit_pressed():
	get_tree().quit()
