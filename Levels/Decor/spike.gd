extends Area2D
#pusku kommentti

func _on_body_entered(body):
	if body.name == "Player":
		Game.player_damage(1)
