extends Node2D

var cball = preload("res://Enemy/cball.tscn")

func _on_timer_timeout():
	var cballTemp = cball.instantiate()
	cballTemp.position = $"../Cannon".global_position
	add_child(cballTemp)
