extends Area2D

@export var speed = 150

var player
var testi = 1

var shooting = true

func _ready():
	print("Cball ready")

func _physics_process(delta):
	global_position.x += -speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		print("pelaajaan osui")
		Game.player_damage(1)
		$AnimatedSprite2D.play("Explosion")
		self.queue_free()
	if body.name == "TileMap":
		$AnimatedSprite2D.play("Explosion")
		self.queue_free()
