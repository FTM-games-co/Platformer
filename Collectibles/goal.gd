extends Area2D

@onready var anim = get_node("AnimatedSprite2D")

func _on_body_entered(body):
	if body.name == "Player" and Game.chest:
		anim.play("Set")
