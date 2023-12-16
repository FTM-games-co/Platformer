extends Node2D

var cball = preload("res://Enemy/cball.tscn")

func _ready():
	$"../Cannon".connect("active", shoot)
	
func shoot():
	var cballTemp = cball.instantiate()
	cballTemp.position = $"../Cannon".global_position
	if $"../Cannon2":
		var cballTemp2 = cball.instantiate()
		cballTemp2.position = $"../Cannon2".global_position
		add_child(cballTemp2)
	else:
		pass
	if $"../Cannon3":
		var cballTemp3 = cball.instantiate()
		cballTemp3.position = $"../Cannon3".global_position
		add_child(cballTemp3)
	else:
		pass
		
	add_child(cballTemp)
	
