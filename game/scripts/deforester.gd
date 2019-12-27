extends Node2D

onready var scene = get_tree().get_current_scene()
onready var run_anim = get_node("deforester_sprite/deforester_run")
onready var attack_anim = get_node("deforester_sprite/attack")

var life = 100
var status = 1

const RUNNING = 1
const ATTACKING = 2

const DAMAGE = 25

var plant = null
const plant_list = ["cactus_area", "coconut_area"]
const projetile_list = ["spike_area", "coco_area"]

func _ready():
	set_process(true)
	
func _process(delta):
	if scene.estado == scene.JOGANDO && life >= 0 && status == RUNNING:
		position = position + Vector2(-40 * delta, 0)
	if position.x < -100:
		queue_free()
	if life < 0:
		scene.deforesters_count += 1
		queue_free()
		scene.deforesters_killed_label.set_text(str(scene.deforesters_count))


func _on_deforester_area_area_entered(area):
	if projetile_list.has(area.name):
		area.owner.queue_free()
		self.life -= area.owner.damage
	if plant_list.has(area.name):
		print("CACTUS AREA")
		self.plant = area.get_parent()
		self.status = ATTACKING
		run_anim.visible = false
		attack_anim.visible = true
		attack_anim.play()


func _on_attack_animation_finished():
	self.plant.life -= self.DAMAGE
	if self.plant.life <= 0:
		self.plant.queue_free()
		attack_anim.stop()
		run_anim.visible = true
		attack_anim.visible = false
		self.status = RUNNING
