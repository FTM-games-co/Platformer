extends Node2D

var player = preload("res://Player/player.tscn")

func _ready():
	spawn_player()

func spawn_player():
	var playerTemp = player.instantiate()
	print("global pos ", self.position)
	add_child(playerTemp)
	playerTemp.global_position = self.global_position

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		print("reload")
		get_tree().reload_current_scene()
