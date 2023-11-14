extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		#var player = get_node("res://Player/player.gd")
		#player.Gold += 1
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0,30), 0.3)
		tween1.tween_property(self, "modulate:a", 0, 0.3)
		tween.tween_callback(queue_free)
		#queue_free()
		#Game.Gold += 1
