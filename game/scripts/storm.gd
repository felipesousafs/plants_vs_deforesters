extends Node2D

var speed = 400
var plant = null

const plant_list = ["cactus_area", "coconut_area"]

func _ready():
	set_process(true)
	
func _process(delta):
	position = position + Vector2(0, speed * delta)
	if position.y > 600:
		speed = -speed
	if position.y < 1:
		queue_free()

func _on_inundation_area_area_entered(area):
	if plant_list.has(area.name):
		self.plant = area.get_parent()
		self.plant.queue_free()
