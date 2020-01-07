extends Position2D

onready var cactus = preload("res://scenes/cactus.tscn")
onready var scene = get_tree().get_current_scene()

func _ready():
	pass


func add_cactus(cac_position, slot):
	var new_cactus = cactus.instance()
	new_cactus.position = cac_position
	new_cactus.slot = slot
	owner.add_child(new_cactus)
	scene.add_water_counter(-new_cactus.COST)