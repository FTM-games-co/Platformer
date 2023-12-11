extends Area2D

@onready var anim = get_node("AnimatedSprite2D")

func _on_body_entered(body):
	if body.name == "Player" and Game.chest and $CollisionShape2D.disabled == false:
		anim.play("Set")
		$CollisionShape2D.disabled = true
		get_tree().change_scene_to_file("res://Menu/finish_screen.tscn")
