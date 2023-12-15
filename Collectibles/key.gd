extends Area2D

var keyeffect = KeyEffect

@onready var anim = get_node("AnimationPlayer")

func _on_body_entered(body):
	if body.name == "Player" and $CollisionShape2D.disabled == false:
		keyeffect.play()
		$CollisionShape2D.disabled = true
		Game.playerKeys += 1
		anim.play("Effect")
		print("Keys: ", Game.playerKeys)
		await get_node("AnimationPlayer").animation_finished
		self.queue_free()
