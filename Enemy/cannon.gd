extends CharacterBody2D

signal active

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var fire = false

func _ready():
	shoot()
	
func shoot():
	get_node("AnimatedSprite2D").play("Fire")
	fire = true	
	await get_node("AnimatedSprite2D").animation_finished
	if fire:
		emit_signal("active")
	cd()
	
func cd():
	get_node("AnimatedSprite2D").play("Idle")
	fire = false
	await get_tree().create_timer(1).timeout
	shoot()

