extends Node


var playerHealth = 5
var playerGold = 0
var playerKeys = 0
var progress = 1
var chest = false
var immortality = false
var dead = false
var prev_scene = null

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
	elif playerHealth <= 0:
		dead = true
	else:
		return
		
func player_immortality():
	immortality = true
	print("immortality is on")
	await get_tree().create_timer(1).timeout
	disable_player_immortality()
	
func disable_player_immortality():
	print("immortality is off")
	immortality = false
#
#func save_scene():
#	prev_scene = get_tree().current_scene.filename
#
#func switch_to_previous_scene():
#	get_tree().change_scene_to_file(prev_scene)
	
