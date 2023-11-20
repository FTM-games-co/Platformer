extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var state = "idle"

func _ready():
	get_node("AnimatedSprite2D").play("Idle")

func _physics_process(delta):
	# Gravity for the crabby
	velocity.y += gravity * delta
	
	match state:
		"chase":
			if get_node("AnimatedSprite2D").animation != "Death":
				get_node("AnimatedSprite2D").play("Jump")
			player = get_node("../../Player/Player")
			var direction = (player.position - self.position).normalized()
			if direction.x > 0:
				get_node("AnimatedSprite2D").flip_h = true
			else:
				get_node("AnimatedSprite2D").flip_h = false
			velocity.x = direction.x * SPEED

		"idle":
			if get_node("AnimatedSprite2D").animation != "Death":
				get_node("AnimatedSprite2D").play("Idle")
			velocity.x = 0

		"attack":
			if get_node("AnimatedSprite2D").animation != "Death":
				get_node("AnimatedSprite2D").play("Attack")

		"dead":
			if get_node("AnimatedSprite2D").animation != "Death":
				if $CollisionShape2D.disabled == false:
					$CollisionShape2D.disabled = true 
				get_node("AnimatedSprite2D").play("Death")
				await get_node("AnimatedSprite2D").animation_finished
				self.queue_free()

	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		state = "chase"

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		state = "idle"

func _on_player_death_body_entered(body):
	if body.name == "Player":
		state = "dead"

func _on_player_attack_body_entered(body):
	if body.name == "Player":
		state = "attack"
		Game.playerHealth -= 1
