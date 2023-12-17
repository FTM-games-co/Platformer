extends CharacterBody2D

var knockback_cooldown = false
@export var speed = 250.0
@export var jump_velocity = -375.0
@onready var anim = get_node("AnimationPlayer")
var hurteffect = HurtEffect
var jumpeffect = JumpEffect

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func take_damage_and_knockback():
	if not knockback_cooldown:
		hurteffect.play()
		knockback_cooldown = true
		Game.player_damage(1)
		knockback()
	if Game.dead == true:
		print("player is now dead")
		var tween = get_tree().create_tween()
		tween.tween_property(self, "modulate:a", 0, 0.3)
		anim.play("Dead")
		await tween.finished
		get_tree().change_scene_to_file("res://Menu/death_screen.tscn")
		Game.player_reset()

func knockback():
	var _direction = Input.get_axis("ui_left", "ui_right")
	velocity.y = jump_velocity * .6
	if get_node("AnimatedSprite2D").flip_h:
		velocity.x = speed
		anim.play("Hit")
	else:
		velocity.x = -speed
		anim.play("Hit")

func _physics_process(delta):
	# Add the gravity.
	if not Game.immortality:
		knockback_cooldown = false
	if Game.immortality and not knockback_cooldown:
		take_damage_and_knockback()
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jumpeffect.play()
		velocity.y = jump_velocity
		anim.play("Jump")
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	if direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
		
	if direction:
		velocity.x = direction * speed
		if velocity.y == 0:
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if velocity.y == 0:
			anim.play("Idle")
	if velocity.y > 0:
		anim.play("Fall")

	move_and_slide()
