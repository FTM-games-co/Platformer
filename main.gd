extends Node2D

func _ready():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	Saveload.loadGame()
