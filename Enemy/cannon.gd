extends CharacterBody2D

signal cball_shot(cball_scene, location)

@onready var marker = $Marker2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var state = "idle"

func _ready():
	get_node("AnimatedSprite2D").play("Idle")

func _physics_process(delta):
	match state:
		"idle":
			get_node("AnimatedSprite2D").play("Idle")
			
		"fire":
			get_node("AnimatedSprite2D").play("Fire")
			
func _on_cannon_range_body_entered(body):
	if body.name == "Player":
		print("tulta")
		state = "fire"
		
func _on_cannon_range_body_exited(body):
	if body.name == "Player":
		state = "idle"
