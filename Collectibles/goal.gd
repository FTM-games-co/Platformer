extends Area2D

@onready var anim = get_node("AnimatedSprite2D")

var progress = Game.progress

func _on_body_entered(body):
	if body.name == "Player" and Game.chest and $CollisionShape2D.disabled == false:
		Game.player_reset()
		anim.play("Set")
		$CollisionShape2D.disabled = true
		
	
		match Game.progress:
			1:
				if not Game.l1:
					Game.progress = 2
					Game.l1 = true
					print("progress saved level 2 now open")
				else:
					print("progress not saved")
					pass
			2:
				if not Game.l2:
					Game.progress = 3
					Game.l2 = true
					print("progress saved level 3 now open")
				else:
					print("progress not saved")
					pass
			3:
				if not Game.l3:
					Game.progress = 4
					Game.l3 = true
				else:
					pass
			4:
				if not Game.l4:
					Game.progress = 5
					Game.l4 = true
				else:
					pass
			_:
				print("nothing was matched")
		Saveload.saveGame()
		get_tree().change_scene_to_file("res://Menu/finish_screen.tscn")
