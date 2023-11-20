extends CharacterBody2D

signal cball_shot(cball_scene, location)

@onready var marker = $Marker2D
@onready var cball_container = preload("res://levels/level_test.tscn").instantiate().get_node("CballContainer")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var state = "idle"
var cball_scene = preload("res://Enemy/cball.tscn")

var shooting_timer = 0
var shooting_interval = 1.0  # Set your desired interval in seconds

func _ready():
	get_node("AnimatedSprite2D").play("Idle")
	# Check the visibility of the container
	cball_shot.connect(_on_cannon_cball_shot)
	if cball_container:
		print("Container Visibility:", cball_container.visible)
	else:
		print("Container not found.")

func _physics_process(delta):
	match state:
		"idle":
			get_node("AnimatedSprite2D").play("Idle")
			#get_node("AnimatedSprite2D").play("CannonIdle")
			
		"fire":
			get_node("AnimatedSprite2D").play("Fire")
			update_shooting(delta)
			
func _on_cannon_range_body_entered(body):
	if body.name == "Player":
		print("tulta")
		state = "fire"
		#shoot()
		
func _on_cannon_range_body_exited(body):
	if body.name == "Player":
		print("kona")
		state = "idle"
		
func update_shooting(delta):
	shooting_timer += delta

	if shooting_timer >= shooting_interval:
		shoot()
		shooting_timer = 0
		
func shoot():
	cball_shot.emit(cball_scene, marker.global_position)
	
func _on_cannon_cball_shot(cball_scene, location):
	var cball = cball_scene.instantiate()
	if cball_container:
		print("cball_container exists")
		cball.global_position = location
		cball_container.add_child(cball)
		cball.visible = true
		print("Cannonball Visibility:", cball.visible)
	else:
		print("cball ei olemassa")
