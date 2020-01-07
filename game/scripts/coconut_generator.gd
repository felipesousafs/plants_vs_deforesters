extends Position2D

onready var coconut = preload("res://scenes/coconut_tree.tscn")
onready var scene = get_tree().get_current_scene()

func _ready():
	pass


func add_coconut(coc_position, slot):
	var new_coconut = coconut.instance()
	new_coconut.position = coc_position
	new_coconut.slot = slot
	owner.add_child(new_coconut)
	scene.add_water_counter(-new_coconut.COST)