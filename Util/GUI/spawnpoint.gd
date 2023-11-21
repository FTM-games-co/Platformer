extends Node2D

var player = preload("res://Player/player.tscn")
var deatheffect = DeathEffect

func spawn_player():
	var playerTemp = player.instantiate()
	print("global pos ", self.position)
	add_child(playerTemp)
	playerTemp.global_position = self.global_position

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		Game.playerHealth -= 1
		spawn_player()
		print("reload")
		get_tree().reload_current_scene()
		if Game.playerHealth == 0:
			get_tree().change_scene_to_file("res://Menu/death_screen.tscn")