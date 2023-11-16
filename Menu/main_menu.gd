extends Node2D

var audio: AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	audio = get_node("res://Audio/back_ground_music.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_music_pressed():
	audio.stop()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Levels/level_test.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Menu/options.tscn")

func _on_quit_pressed():
	get_tree().quit()
