extends Area2D

@export var speed = 200

var player

var shooting = true

func _ready():
	print("Cball ready")

func _physics_process(delta):
	global_position.x += -speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		print("pelaajaan osui")
		Game.playerHealth -= 1
		$AnimatedSprite2D.play("Explosion")
		self.queue_free()
	if body.name == "TileMap":
		$AnimatedSprite2D.play("Explosion")
		self.queue_free()
