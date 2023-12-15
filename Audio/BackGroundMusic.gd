extends AudioStreamPlayer2D
var backgroundmusic = BackGroundMusic
func _on_area_2d_area_entered(area):
	backgroundmusic.play()
