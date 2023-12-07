extends Control


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate:a", 1, 0.3)

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate:a", 0, 0.3)
