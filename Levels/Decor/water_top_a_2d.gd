extends Area2D

var player = preload("res://Player/player.tscn")

func _on_body_entered(body):
	if body.name == "Player":
		Game.playerHealth = 0
		
func _on_body_exited(body):
	if body.name == "Player":
		Game.playerHealth = 0
