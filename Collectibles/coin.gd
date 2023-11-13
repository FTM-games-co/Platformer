extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		#Game.Gold += 1
		queue_free()
