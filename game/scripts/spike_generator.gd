extends Position2D

onready var spike = preload("res://scenes/spike.tscn")

func _ready():
	pass
	
func create_spike():
	var new_spike = spike.instance()
	new_spike.position = (Vector2(60, 20))
	owner.add_child(new_spike)