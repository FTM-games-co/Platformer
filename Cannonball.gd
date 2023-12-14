extends CharacterBody2D
var player
@export var CANNONBALL_SPEED = 100.0
var cannonballVelocity: Vector2
var state = "idle"

#test

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("Idle")
	cannonballVelocity = Vector2(-CANNONBALL_SPEED, 0)  # Initialize the velocity here

func _physics_process(delta):
	match state:
		"idle":
			get_node("AnimatedSprite2D").play("Idle")
		
		"explosion":
			get_node("AnimatedSprite2D").play("Explosion")
			await get_node("AnimatedSprite2D").animation_finished
			self.queue_free()

func _on_player_hit_body_entered(body):
	if body.name == "Player":
		state = "explosion"
		Game.playerHealth -= 1
