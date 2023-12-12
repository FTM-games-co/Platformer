extends Node

const SAVE_PATH = "res://savedata.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"progress": Game.progress,
		"L1passed": Game.l1,
		"L2passed": Game.l2,
		"L3passed": Game.l3,
		"L4passed": Game.l4,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.progress = current_line["progress"]
				Game.l1 = current_line["L1passed"]
				Game.l2 = current_line["L2passed"]
				Game.l3 = current_line["L3passed"]
				Game.l4 = current_line["L4passed"]
