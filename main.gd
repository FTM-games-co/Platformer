extends Node2D


# Called when the node enters the scene tree for the first time.
# Runs to main menu.
func _ready():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")

