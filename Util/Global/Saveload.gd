extends Node

const SAVE_PATH = "res://savedata.bin"
const SCORE_PATH = "res://scoredata.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"progress": Game.progress,
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

func saveScore():
	var file = FileAccess.open(SCORE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"l1score": Game.l1score,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadScore():
	var file = FileAccess.open(SCORE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SCORE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.l1score = current_line["l1score"]

