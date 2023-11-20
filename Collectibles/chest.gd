extends Area2D

@onready var anim = get_node("AnimationPlayer")
var opened = false

func _on_body_entered(body):
	if body.name == "Player" and Game.playerKeys > 0 and opened == false:
		opened = true
		Game.playerKeys -= 1
		print("Keys: ", Game.playerKeys)
		anim.play("Unlocked")
		
