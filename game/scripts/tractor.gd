extends Node2D

onready var scene = get_tree().get_current_scene()

var life = 300

const DAMAGE = 999

var plant = null
const plant_list = ["cactus_area", "coconut_area"]
const projetile_list = ["spike_area", "coco_area"]

func _ready():
		set_process(true)
	
func _process(delta):
	if scene.estado == scene.JOGANDO && life >= 0:
		position = position + Vector2(-42 * delta, 0)
	if position.x < -100 || life < 0:
		queue_free()

func _on_tractor_area_area_entered(area):
	if projetile_list.has(area.name):
		area.owner.queue_free()
		self.life -= area.owner.damage
	if plant_list.has(area.name):
		print("PLANT AREA")
		self.plant = area.get_parent()
		self.plant.queue_free()