extends Node


var playerHealth = 5
var playerGold = 0
var playerKeys = 0
var progress = 1
var immortality = false

func player_damage():
	if not immortality:
		playerHealth -= 1
		player_immortality()
		
func player_immortality():
	immortality = true
	print("immortality is on")
	await get_tree().create_timer(1).timeout
	disable_player_immortality()
	
func disable_player_immortality():
	print("immortality is off")
	immortality = false
