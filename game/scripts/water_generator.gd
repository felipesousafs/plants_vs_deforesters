extends Position2D

onready var water = preload("res://scenes/water_fragment.tscn")

func _ready():
	randomize()
	
func create_water():
	var new_water = water.instance()
	new_water.position = (Vector2(rand_range(0, 800), 0))
	owner.add_child(new_water)

func _on_water_gen_timer_timeout():
	create_water()
