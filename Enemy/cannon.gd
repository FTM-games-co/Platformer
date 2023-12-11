extends CharacterBody2D

signal cball_shot(cball_scene, location)

@onready var marker = $Marker2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var state

func _ready():
	state = "fire"

func _physics_process(delta):
	match state:
		"fire":
			get_node("AnimatedSprite2D").play("Fire")
