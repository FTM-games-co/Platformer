extends Node


var playerHealth = 5
var playerGold = 0
var playerKeys = 0
var progress = 1
var chest = false
var immortality = false
var dead = false

func player_reset():
	playerHealth = 5
	playerGold = 0
	playerKeys = 0
	dead = false
	chest = false

func player_damage(amount):
	if not immortality:
		playerHealth -= amount
		player_immortality()
	if playerHealth <= 0:
		dead = true
		
func player_immortality():
	immortality = true
	print("immortality is on")
	await get_tree().create_timer(1).timeout
	disable_player_immortality()
	
func disable_player_immortality():
	print("immortality is off")
	immortality = false
