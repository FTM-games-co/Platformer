extends Node2D

var cball = preload("res://Enemy/cball.tscn")

func _ready():
	$"../Cannon".connect("active", shoot)
	
func shoot():
	var cballTemp = cball.instantiate()
	cballTemp.position = $"../Cannon".global_position
	add_child(cballTemp)
	
