extends Node2D

var backgroundmusic = BackGroundMusic
var clickeffect = ClickEffect
var clickeffect2 = ClickEffect2

func _ready():
	get_node("AnimatedSprite2D").play("Run")

func _on_play_button_pressed():
	clickeffect2.play()
	get_tree().change_scene_to_file("res://Menu/Level_selection/level_select.tscn")

func _on_menu_button_pressed():
	clickeffect.play()
	get_tree().change_scene_to_file("res://Menu/options.tscn")

func _on_quit_button_pressed():
	clickeffect.play()
	get_tree().quit()
