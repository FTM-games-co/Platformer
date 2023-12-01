extends Area2D

var player = preload("res://Player/player.tscn")

@export var PLAYER_IN: PackedScene = null
@export var PLAYER_OUT: PackedScene = null

func _on_body_entered(body):
	if body.name == "Player":
		spawn_effect(PLAYER_IN)
		Game.playerHealth = 0
		
func _on_body_exited(body):
	if body.name == "Player":
		spawn_effect(PLAYER_OUT)
		Game.playerHealth = 0


func spawn_effect(EFFECT: PackedScene, effect_position: Vector2 = player.position):
	if EFFECT:
		var effect = EFFECT.instantiate()
		get_tree().current_scene.add_child(effect)
		effect.global_position = effect_position
