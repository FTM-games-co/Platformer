extends Area2D

@export var speed = 200

var player

func _ready():
	$AnimatedSprite2D.play("Idle")
	print("Cball ready")

func _physics_process(delta):
	global_position.x += -speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		print("pelaajaan osui")
		Game.playerHealth -= 1
		$AnimatedSprite2D.play("Explosion")
		# Jätetty tarkoituksella pois tuo animaatio
		#await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	$AnimatedSprite2D.play("Explosion")
	self.queue_free()
