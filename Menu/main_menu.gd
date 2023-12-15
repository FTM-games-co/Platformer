extends Node2D

var backgroundmusic = BackGroundMusic
var clickeffect = ClickEffect
var clickeffect2 = ClickEffect2

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("Run")

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Menu/Level_selection/level_select.tscn")
	clickeffect2.play()

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Menu/options.tscn")
	clickeffect.play()

func _on_quit_button_pressed():
	get_tree().quit()
	clickeffect.play()
