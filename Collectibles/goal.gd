extends Area2D

@onready var anim = get_node("AnimatedSprite2D")

func _on_body_entered(body):
	if body.name == "Player" and Game.chest and $CollisionShape2D.disabled == false:
		anim.play("Set")
		$CollisionShape2D.disabled = true
		
		
		match Game.prev_scene:
			"res://Levels/level_1.tscn":
				print("you completed level one")
				Game.progress = 2
			"res://Levels/level_2.tscn":
				print("you completed level two")
				Game.progress = 3
			_:
				print(Game.prev_scene)
		
		Saveload.saveGame()
		Game.player_reset()
		get_tree().change_scene_to_file("res://Menu/finish_screen.tscn")
