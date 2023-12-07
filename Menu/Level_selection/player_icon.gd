extends Control

@onready var anim = get_node("AnimationPlayer")
var animplayer: AnimationPlayer

func _input(event):
	if event.is_action_pressed("ui_left"):
		anim.play("Run")
		get_node("AnimatedSprite2D").flip_h = true
	if event.is_action_pressed("ui_right"):
		anim.play("Run")
		get_node("AnimatedSprite2D").flip_h = false
	if event.is_action_pressed("ui_up"):
		anim.play("Run")
	if event.is_action_pressed("ui_down"):
		anim.play("Run")
	else:
		await get_node("AnimationPlayer").animation_finished
		anim.play("Idle")
