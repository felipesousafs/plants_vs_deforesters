extends Position2D

onready var cloud = preload("res://scenes/cloud_cold.tscn")
onready var scene = get_tree().get_current_scene()

func _ready():
	pass


func add_cloud(card_position):
	var new_cloud = cloud.instance()
	new_cloud.position = card_position
	owner.add_child(new_cloud)
	scene.add_water_counter(-new_cloud.COST)