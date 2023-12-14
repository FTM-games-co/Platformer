extends CharacterBody2D

var player
var state = "idle"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match state:
		"opening":
			get_node("AnimatedSprite2D").play("Opening")
			await get_node("AnimatedSprite2D").animation_finished
		
		"idle":
			get_node("AnimatedSprite2D").play("Idle")
			
		"bite":
			get_node("AnimatedSprite2D").play("Bite")
			await get_node("AnimatedSprite2D").animation_finished


func _on_player_detection_body_entered(body):
	# Trying to lure the player closer by opening
	if body.name == "Player":
		state = "opening"


func _on_player_detection_body_exited(body):
	# Closing after player goes off the radar
	if body.name == "Player":
		state = "idle"


func _on_player_attack_body_entered(body):
	# Trying to bite the player
	if body.name == "Player":
		state = "bite"
		Game.player_damage(2)
