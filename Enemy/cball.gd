extends Area2D

@export var speed = 150

func _physics_process(delta):
	global_position.x += -speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		speed = 0
		print("pelaajaan osui")
		Game.player_damage(1)
		get_node("AnimatedSprite2D").play("Explosion")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()
	if body.name == "TileMap":
		speed = 0
		get_node("AnimatedSprite2D").play("Explosion")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()
